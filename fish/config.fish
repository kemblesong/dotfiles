for file in ~/.config/fish/conf.d/*.fish
  source $file
end

# vi mode
fish_vi_key_bindings

function fish_mode_prompt
end function

abbr -a v vim
abbr -a g git
abbr -a gb git branch
abbr -a gco git checkout
abbr -a gs git status
abbr -a gl git log
abbr -a o open

set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x E7_SMTP_SERVER smtp.sendgrid.net
set -x E7_SMTP_PORT 587
set -x E7_SMTP_USER evolution7_websites
set -x E7_SMTP_PASSWORD wyk3Pak1hoV2yuf3chec2ant
