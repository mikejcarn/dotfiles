# FISH CONFIG ---------------------------------------------

set fish_greeting               # Suppress fish intro message

# ENVIRONMENT VARIABLES -----------------------------------

export EDITOR=nvim
export TERM=xterm-kitty
export PRETTIERD_DEFAULT_CONFIG="/home/mjc/.config/nvim/lua/plugins/null_format/formatter_configs/prettier.config.js"
# export PYENV_ROOT="/home/mjc/.pyenv/"

# Vi Mode -------------------------------------------------

# Enable
function fish_user_key_bindings
    fish_vi_key_bindings
    
    # Set Ctrl-j to accept auto-suggestion
    bind -M insert \cj accept-autosuggestion
    bind \cj accept-autosuggestion
end

# Vi Cursor
set fish_cursor_default block blink
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# Pyenv ----------------------------------------------------

# set -Ux PYENV_ROOT $HOME/.pyenv
# fish_add_path $PYENV_ROOT/bin
# pyenv init - | source

# Alias ----------------------------------------------------

# Terminal
alias c="clear"
alias e="exit"
alias ...="cd ../.."
alias ls="lsd --group-dirs first"
alias l="lsd -1 --group-dirs first"
alias ll="lsd -la"
alias t="touch "

# Directories
alias h="cd ~"
alias d="cd ~/Desktop"
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias music="cd ~/Music"
alias pics="cd ~/Pictures"
alias vids="cd ~/Videos"

# Config Files
alias fishrc="nvim ~/.config/fish/config.fish"
alias kittyrc="nvim ~/.config/kitty/kitty.conf"
alias starshiprc="nvim ~/.config/starship.toml"
alias rc="nvim ~/.config/ranger/rc.conf"

# Nvim Config Files
alias vc="nvim ~/.config/nvim/init.lua"
alias vmap="nvim ~/.config/nvim/lua/mappings/init.lua"
alias vset="nvim ~/.config/nvim/lua/settings/init.lua"
alias vp="nvim ~/.config/nvim/lua/plugins/packer.lua"
alias vs="nvim ~/.config/nvim/lua/setinitinittings/init.lua"
alias vpc="nvim ~/.config/nvim/lua/plugins/configs.lua"
alias vcmp="nvim ~/.config/nvim/lua/plugins/cmp.lua"
alias vlsp="nvim ~/.config/nvim/lua/plugins/lsp/init.lua"
alias vnull="nvim ~/.config/nvim/lua/plugins/lsp/null_ls.lua"
alias vcol="nvim ~/.config/nvim/lua/colorschemes/init.lua"
alias vdap="nvim ~/.config/nvim/lua/plugins/dap/init.lua"
alias vf="cd ~/.config/nvim"

# Applications
alias v="nvim"
alias r="ranger"
alias hl="helix"
alias rs="redshift -O "
alias rsd="redshift -x"
alias rs2="redshift -x; redshift -O 2222 -b 0.75"
alias rs3="redshift -x; redshift -O 3333 -b 0.75"
alias C="cmatrix -C magenta"
alias yt="yt-dlp"

# Git
alias gcl="git clone "
alias gc="git commit -m "
alias gs="git status"
alias ga="git add ."
alias gp="git push"
alias lg="lazygit"

# Custom Functions -----------------------------------------

function mkcd
    set dir $argv[1]
    mkdir -p $dir
    cd $dir
end

# Pyenv (python version control) ---------------------------

eval "$(pyenv init -)" # init in terminal

# Starship Prompt ------------------------------------------

starship init fish | source
