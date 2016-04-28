#!/usr/bin/env bash

# Setup fisherman
if test ! $(which fisher)
then
  echo "  Installing fisherman"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fi

# Setup vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Setup fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Symlink files
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/fish/fishfile ~/.config/fish/fishfile
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Set fish as default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
