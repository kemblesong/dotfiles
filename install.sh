#!/usr/bin/env bash

# Install Homebrew.
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

# Update homebrew
brew doctor
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Essentials
brew install fish
brew install tmux
brew install neovim

# Dev stuff
brew install node

# Misc
brew install fortune
brew install cowsay
brew install tree

# Install native applications
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew cask install iterm2-beta
brew cask install font-source-code-pro
brew cask install google-chrome
brew cask install firefox
brew cask install slack
brew cask install spectacle
#brew cask install transmission
#brew cask install vlc

# Remove outdated versions from the cellar.
brew cleanup
