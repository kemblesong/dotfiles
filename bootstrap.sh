#!/usr/bin/env bash

# Setup fisherman
if test ! $(which fisher)
then
  echo "  Installing fisherman"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fi

# Setup tmux plugin manager
if test ! -d ~/.tmux/plugins/tpm
then
  echo "  Installing tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Setup vim-plug
if test ! -f ~/.config/nvim/autoload/plug.vim
then
  echo "  Installing vim-plug"
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if test ! -f ~/.vim/autoload/plug.vim
then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Setup fzf
if test ! -d ~/.fzf
then
  echo "  Installing fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
fi

# Symlink files
echo "  Symlinking config files"
ln -fs ~/dotfiles/vim/vimrc ~/.vimrc
ln -fs ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -fs ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -fs ~/dotfiles/fish/fishfile ~/.config/fish/fishfile
ln -fs ~/dotfiles/git/config ~/.config/git/config
ln -fs ~/dotfiles/git/ignore ~/.config/git/ignore
ln -fs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -fs ~/dotfiles/ctags/ctags ~/.ctags

# Set zsh as default shell
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

echo "Done! Remember to run app specific plugin installers (fisher, Prefix + I, :PlugInstall)."
