# Dotfiles

Those are some dotfiles and config files I use.

# Preparing a new computer

- Generate a ssh key and add it to github.
- `ln -s ~/workspace/dotfiles/gitconfig ~/.gitconfig`
- Clone this repo: `mkdir -p ~/workspace/dotfiles && git clone git@github.com:acroca/dotfiles.git ~/workspace/dotfiles`
- [brew](http://brew.sh/)
- Boot2docker: `brew install boot2docker`
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Slate](https://github.com/jigish/slate)
- [Sublime](https://www.sublimetext.com)
- Install dropbox
- Install 1Password (App Store)
- Install Caffeine (App Store)
- Sublime command line: `ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
- [Sublime package manager](https://packagecontrol.io/installation)
- Install Sublime packages (list below)
- `rm -rf ~/Library/Application Support/Sublime Text 3/Packages/User && ln -s ~/workspace/dotfiles/SublimeUserPackage ~/Library/Application Support/Sublime Text 3/Packages/User`
- `ln -s ~/workspace/dotfiles/SublimeUserPackage User`
- [Google Chrome](http://www.google.com/chrome/)
- [Install n](https://github.com/tj/n)
- Add `d.lo` to /etc/hosts: `192.168.59.103  d.lo`

# Sublime packages

- Better CoffeeScript
- Dockerfile Syntax Highlighting
- Git
- GitGutter
- Jade
- MarkdownEditing
- Package Control
- Predawn
- Pretty JSON
- SCSS
- SideBarEnhancements
- Stylus
- TrailingSpaces


#OSX

- Trackpad: Disable "Swipe between full-screen apps"
- Trackpad: Set "Swipe between pages" to three fingers
