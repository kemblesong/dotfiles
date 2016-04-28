for file in ~/.config/fish/conf.d/*.fish
  source $file
end

function vim
  nvim
end

function v
  nvim
end

set -U EDITOR nvim
#set -x VIRTUAL_ENV_DISABLE_PROMPT 1
