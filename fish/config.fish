for file in ~/.config/fish/conf.d/*.fish
  source $file
end

# vi mode
fish_vi_key_bindings

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

# set -x FZF_DEFAULT_COMMAND 'ag -g ""'
