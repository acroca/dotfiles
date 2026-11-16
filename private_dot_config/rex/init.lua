-- Rex configuration, migrated from Ghostty.
-- The Ghostty config was empty, so only the cmd+k decision is recorded here.

-- cmd+k clears the terminal, as in Terminal.app, iTerm2 and Ghostty.
rex.bind("cmd+k", "com.superlogical.terminal.clear")

-- The session picker (Rex's default on cmd+k) moves to shift+cmd+k.
rex.bind("shift+cmd+k", "session.switch")
