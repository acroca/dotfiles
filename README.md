# Dotfiles

Here is my dotfiles.

# Preparing a new computer

- Install [brew](https://brew.sh/)
- `brew install chezmoi`
- `chezmoi init --apply https://github.com/acroca/dotfiles.git`

  `chezmoi init` prompts for the machine-specific values below and stores them
  in `~/.config/chezmoi/chezmoi.toml`.

# Machine-specific configuration

Values live in the `[data]` section of `~/.config/chezmoi/chezmoi.toml`:

```toml
[data]
  email = "foo@bar.com"
  monitor_input = "16"
  signingkey = "0123456789ABCDEF"
```

| Field           | Required | What it does                                                                | How to get the value                             |
| --------------- | -------- | --------------------------------------------------------------------------- | ------------------------------------------------ |
| `email`         | yes      | Git author email.                                                           |                                                  |
| `monitor_input` | no       | Enables the Hammerspoon monitor auto-switch, using this Mac's monitor input. | `m1ddc get input` while the monitor shows this Mac |
| `signingkey`    | no       | Enables GPG signing of git commits and tags with this key.                  | `gpg --list-secret-keys --keyid-format=long`     |

Leave an optional field empty (or answer the prompt with nothing) to turn its
feature off.

To change a value later, edit `~/.config/chezmoi/chezmoi.toml` and run
`chezmoi apply`. Running `chezmoi init` again only prompts for values that are
missing from that file.

## Private Claude Code settings

Optional. Settings that should not be in this repo go in
`~/.config/chezmoi/claude-settings.private.json`, using the same format as
`~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "some-plugin@some-marketplace": true
  }
}
```

When the file exists it is merged on top of
`.chezmoitemplates/claude_settings.json` to render `~/.claude/settings.json`.
Run `chezmoi apply` after changing it.
