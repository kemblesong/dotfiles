for file in ~/.config/fish/conf.d/*.fish
  source $file
end

# vi mode
fish_vi_mode

function fish_mode_prompt
end function

abbr -a v nvim
abbr -a vim nvim
abbr -a g git
abbr -a gb git branch
abbr -a gco git checkout
abbr -a gs git status
abbr -a gl git log
abbr -a o open

set -U fish_user_paths $HOME/.cargo/bin $HOME/.local/bin $fish_user_paths
set -U EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x GOPATH $HOME/gospace
set -x HAXE_STD_PATH /usr/local/lib/haxe/std
set -x CARGO_HOME $HOME/.cargo
set -x RUST_SRC_PATH /usr/local/src/rust/1.10.0/src
