#!/usr/bin/env node
'use strict';

/**
 * PreToolUse hook: deny mutating git subcommands in Bash tool calls.
 *
 * Unlike prefix-based permission rules (`Bash(git commit:*)`), this parses the
 * command, so `git -C <path> commit`, `git --git-dir=... push`, `cd x && git add .`,
 * `/usr/bin/git commit`, `command git commit`, and `sh -c "git commit"` are all caught.
 */

const DENIED = new Set([
  'add', 'commit', 'push', 'pull', 'fetch', 'merge', 'rebase', 'reset', 'revert',
  'cherry-pick', 'checkout', 'switch', 'restore', 'rm', 'mv', 'stash', 'clean',
  'tag', 'branch', 'am', 'apply', 'clone', 'init', 'config', 'remote', 'submodule',
  'worktree', 'update-ref', 'update-index', 'notes', 'gc', 'prune', 'filter-branch',
  'sparse-checkout',
]);

// git global options that consume the following token as their value
const OPTS_WITH_VALUE = new Set([
  '-C', '-c', '--git-dir', '--work-tree', '--namespace', '--exec-path',
  '--config-env', '--attr-source', '--super-prefix', '--list-cmds',
]);

function tokenize(cmd) {
  const tokens = [];
  let cur = '';
  let inSingle = false;
  let inDouble = false;
  const flush = () => {
    if (cur) tokens.push(cur);
    cur = '';
  };
  for (let i = 0; i < cmd.length; i++) {
    const ch = cmd[i];
    if (inSingle) {
      if (ch === "'") inSingle = false;
      else cur += ch;
      continue;
    }
    if (inDouble) {
      if (ch === '"') inDouble = false;
      else if (ch === '\\' && i + 1 < cmd.length) cur += cmd[++i];
      else cur += ch;
      continue;
    }
    if (ch === "'") { inSingle = true; continue; }
    if (ch === '"') { inDouble = true; continue; }
    if (ch === '\\' && i + 1 < cmd.length) { cur += cmd[++i]; continue; }
    if (/\s/.test(ch)) { flush(); continue; }
    if ('|&;<>()`$'.includes(ch)) { flush(); tokens.push(ch); continue; }
    cur += ch;
  }
  flush();
  return tokens;
}

// Programs whose string argument is executed as shell code.
const STRING_EXECUTORS = new Set(['sh', 'bash', 'zsh', 'dash', 'ksh', 'fish', 'eval', 'su']);

function precededByExecutor(tokens, t) {
  for (let k = t - 1; k >= 0; k--) {
    const prev = tokens[k];
    if (prev.startsWith('-')) continue;
    const prevBase = prev.replace(/\\/g, '/').split('/').pop().toLowerCase();
    return STRING_EXECUTORS.has(prevBase);
  }
  return false;
}

function findDeniedGit(tokens, depth = 0) {
  if (depth > 4) return null;
  for (let t = 0; t < tokens.length; t++) {
    const tok = tokens[t];
    // Scan quoted scripts (sh -c "...", eval "...") as commands in their own right.
    if (/\s/.test(tok) && /\bgit\b/i.test(tok) && precededByExecutor(tokens, t)) {
      const hit = findDeniedGit(tokenize(tok), depth + 1);
      if (hit) return hit;
    }
    const base = tok.replace(/\\/g, '/').split('/').pop().toLowerCase();
    if (base !== 'git' && base !== 'git.exe') continue;

    // Skip git's global options to reach the subcommand.
    let j = t + 1;
    while (j < tokens.length) {
      const arg = tokens[j];
      if (OPTS_WITH_VALUE.has(arg)) { j += 2; continue; }
      const name = arg.includes('=') ? arg.slice(0, arg.indexOf('=')) : arg;
      if (OPTS_WITH_VALUE.has(name)) { j += 1; continue; } // --git-dir=x form
      if (/^-C.+/.test(arg) || /^-c.+/.test(arg)) { j += 1; continue; } // -Cpath / -ck=v
      if (arg.startsWith('-')) { j += 1; continue; } // --no-pager, -p, ...
      break;
    }
    if (j < tokens.length && DENIED.has(tokens[j].toLowerCase())) {
      return tokens[j].toLowerCase();
    }
  }
  return null;
}

let raw = '';
process.stdin.on('data', (chunk) => { raw += chunk; });
process.stdin.on('end', () => {
  let input;
  try {
    input = JSON.parse(raw);
  } catch {
    process.exit(0);
  }
  const command = input && input.tool_input && input.tool_input.command;
  if (typeof command !== 'string') process.exit(0);

  let denied = null;
  try {
    denied = findDeniedGit(tokenize(command));
  } catch {
    // Parser trouble on a git-looking command: fail closed.
    denied = /\bgit\b/i.test(command) ? 'unparseable git invocation' : null;
  }
  if (denied) {
    const decision = {
      hookSpecificOutput: {
        hookEventName: 'PreToolUse',
        permissionDecision: 'deny',
        permissionDecisionReason:
          `'git ${denied}' is blocked by the deny-git-writes hook. ` +
          'Ask the user to run this git command themselves.',
      },
    };
    console.log(JSON.stringify(decision));
  }
  process.exit(0);
});
