#ZSH CONFIG >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# chsh -s $(which zsh) # Change Shell to ZSH

# neofetch # OS Info Banner

export PATH="$HOME/bin:$PATH"
export EDITOR='nvim'

autoload -U colors && colors

stty stop "" # Allow Ctrl+S in VIM

#TERMINAL >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#GIT: Check/Install
if ! [ -f $(where git | head -n 1 | sed -e 's/\s.*$//') ]; then
  echo 'GIT NOT INSTALLED: Installing GIT...'
  apt install git -y
fi

#CURL: Check/Install
if ! [ -f $(where curl | head -n 1 | sed -e 's/\s.*$//') ]; then
  echo 'CURL NOT INSTALLED: Installing CURL...'
  apt install curl -y
fi

#PROMPT >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#STARSHIP: Check/Install/Init
if ! [ -f $(where starship | head -n1 | sed -e 's/\s.*$//') ]; then
  echo 'STARSHIP NOT INSTALLED: Installing Starship...'
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    else
      #init Starship Prompt eval
      eval "$(starship init zsh)" 
fi

#NEOVIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#NEOVIM 5 (Nightly): Check/Install
if ! [[ -f $(where nvim | head -n1 | sed -e 's/\s.*$//') || -f $(where nvim-nightly | head -n1 | sed -e 's/\s.*$//') ]]; then
  echo 'NEOVIM NOT INSTALLED: Installing NeoVim...'
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim;
chmod +x /tmp/nvim;
sudo mv /tmp/nvim /usr/local/bin;
fi

#PLUGINS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#ZPLUG: Check/Install
if ! [ -d ~/.zplug ]; then
  echo 'ZPLUG not installed: Installing ZPlug...'
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  exit

  else
    #Load Plugins ----------------------------------------------------
    source ~/.zplug/init.zsh
    zplug "plugins/man", from:oh-my-zsh
    zplug "Peltoche/lsd"
    zplug "plugins/sudo", from:oh-my-zsh
    zplug "plugins/history", from:oh-my-zsh
    zplug "plugins/extract", from:oh-my-zsh
    zplug "plugins/encode64", from:oh-my-zsh
    zplug "jeffreytse/zsh-vi-mode"
    zplug "plugins/zsh-completions", from:oh-my-zsh
    zplug "plugins/colored-man-pages", from:oh-my-zsh
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "MichaelAquilina/zsh-you-should-use"
    zplug "zsh-users/zsh-history-substring-search"

    zplug "junegunn/fzf"
    zplug "junegunn/fzf-bin", \
        from:gh-r, \
        as:command, \
        rename-to:fzf, \
        use:"*linux*amd64*"
    source $ZPLUG_HOME/repos/junegunn/fzf/shell/completion.zsh
    source $ZPLUG_HOME/repos/junegunn/fzf/shell/key-bindings.zsh

      # Install packages that have not been installed yet
      if ! zplug check --verbose; then
          printf "Install? [y/N]: "
          if read -q; then
              echo; zplug install
          else
              echo
          fi
      fi
    zplug load

#Config Plugs --------------------------------------------------------

    # VIM-Mode
    bindkey -v
    #10ms delay for key sequences
    export KEYTIMEOUT=1
    ZVM_KEYTIMEOUT=0.01
    ZVM_ESCAPE_KEYTIMEOUT=0.01
    ZVM_VI_SURROUND_BINDKEY=s-prefix
    ZVM_VI_HIGHLIGHT_BACKGROUND=#333333
    # edit line in vim buffer "ctrl-v"
    autoload edit-command-line; zle -N edit-command-line
    bindkey '^v' edit-command-line
    # edit cmd in Vim
    autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

    #Autosuggestions History 
    HISTFILE=~/.cache/zsh/history
    HISTSIZE=1000
    SAVEHIST=1000
    setopt appendhistory

    bindkey '^j' autosuggest-accept

    # Enable colors and change prompt:
    autoload -U colors && colors

    # Enable TAB-Completion
    autoload -U compinit && compinit -u
    zstyle ':completion:*' menu select
    zmodload zsh/complist

    # Select backward: Shift+TAB 
    bindkey '^[[Z' reverse-menu-complete

    # use the vi navigation keys in menu completion
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history

    # Case Insensitive
    zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    _comp_options+=(globdots)		# Include hidden files.

    # Partial Completion
    zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 

    # fzf searches .dotfiles
    export FZF_DEFAULT_COMMAND="find -L"

    # Enable Search History
    bindkey '^R' history-incremental-pattern-search-backward
fi

#ALIASES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# CONFIG
alias vimrc="nvim ~/.config/nvim/init.vim"
alias vrc="nvim ~/.config/nvim/init.vim"
alias vc="nvim ~/.config/nvim/init.vim"

alias vf="cd ~/.config/nvim"
alias vp="nvim ~/.config/nvim/vim-plug/plugins.vim"
alias vw="cd ~/.config/nvim/vimwiki"

alias zshrc="nvim ~/.zshrc"
alias zrc="nvim ~/.zshrc"
alias zc="nvim ~/.zshrc"

alias kittyrc="nvim ~/.config/kitty/kitty.conf"
alias krc="nvim ~/.config/kitty/kitty.conf"
alias kc="nvim ~/.config/kitty/kitty.conf"

alias starship="nvim ~/.config/starship.toml"

# TERMINAL COMMANDS
alias ssh="kitty +kitten ssh"

alias e="exit"
alias c="clear"
alias r="ranger"
alias t="touch"

alias vim="nvim"
alias vi="nvim"
alias V="nvim"
alias v="nvim"

alias z="fzf"

alias suspend="sudo pm-hibernate"
alias hibernate="sudo pm-hibernate"
alias sleep="sudo pm-hibernate"
alias shutdown="shutdown now"
alias restart="shutdown -r"

alias tree="tree --dirsfirst"

alias diff="diff --color -u"

alias ta="~/bin/titlebar_add.sh"
alias tq="~/bin/titlebar_remove.sh"

# List Files
if [ -f $(where lsd | head -n1 | sed -e 's/\s.*$//') ]; then
alias lx="lsd --group-dirs first -a"
alias l="lsd -l --group-dirs first"
alias ls="lsd --group-dirs first"
alias ll="lsd -la --group-dirs first"
fi

# GIT
alias gi="git init"
alias ga="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gr="git reset"
alias ghp="git add .; git commit -m 'ghp'; git push heroku master"

# DIRECTORIES
alias h="cd ~"
alias d="cd ~/Desktop"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias music="cd ~/Music"
alias pics="cd ~/Pictures"
alias videos="cd ~/Videos"
alias vids="cd ~/Videos"

alias ..="cd .."

alias bin="cd ~/bin"
alias media="cd /media"

alias web="cd ~/Desktop/WebDev"

alias trash="cd ~/.local/share/Trash/files"
alias emptyTrash="rm -rf ~/.local/share/Trash/files/*"

# MOUNT + ENTER DRIVES
alias win7="sudo mount /dev/sdc3 /media/win7 && cd /media/win7"
alias ntfs1="sudo mount /dev/sda2 /media/ntfs1 && cd /media/ntfs1"
alias ntfs2="sudo mount /dev/sda3 /media/ntfs2 && cd /media/ntfs2"
alias ntfs3="sudo mount /dev/sda4 /media/ntfs3 && cd /media/ntfs3"
alias unmount_drives="cd ~ && sudo umount /media/*"

# PROGRAM COMMANDS
alias clonezilla="sudo tuxboot"
alias blender="/Custom-Software/blender-2.90.1-linux64/blender"
alias meshroom="/Custom-Software/Meshroom-2019.2.0/Meshroom"
alias yt="youtube-dl"
alias C="cmatrix -C magenta"
alias ps="pipenv shell"


# MISCELLANEOUS
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias rs="redshift -P -O "

#FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

command_exists() {
    # check if command exists and fail otherwise
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "I require $1 but it's not installed. Abort."
        exit 1
    fi
}

# Make dir and cd into init
mcd() {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}

vd () {
  if [ "${#}" -ne 2 ] ; then
    echo "vdiff requires two args"
    echo " comparing dirs: vdiff d1 d2"
    echo " comparing files: vdiff f1 f2"
    return 1
  fi

  local left="${1}"
  local right="${2}"

  if [ -d "${left}"  ] && [ -d "${right}" ]; then
    vim +"DirDiff ${left} ${right}"
  else
    vim -d "${left}" "${right}"
  fi
}

# Codi: "$ codi" 
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

# Run NVM using ZSH
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

#MISC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/acorn/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/acorn/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/acorn/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/acorn/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
