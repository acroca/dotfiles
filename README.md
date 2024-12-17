# Dotfiles

Here is my dotfiles.

# Preparing a new computer

- Install [brew](https://brew.sh/)
- `brew install chezmoi`
- Create a new machine-specific configuration file in `~/.config/chezmoi/chezmoi.toml`
    Example:
    ```
    [data]
        email = "foo@bar.com"
    ```
- `chezmoi init --apply https://github.com/acroca/dotfiles.git`
