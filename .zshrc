export DOTFILES=$HOME/.dotfiles
# If you come from bash you might have to change your $PATH.
export PATH=$DOTFILES/bin:$HOME/bin:$HOME/.nix-profile/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin/:$HOME/go/bin:$PATH


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.

setopt appendhistory
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=zh_CN.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

autoload -Uz compinit
autoload bashcompinit
compinit
bashcompinit

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export ZSH_CACHE_DIR=~/.dotfiles/zsh/my-site-functions

# Source all .zsh files inside the zsh/ directory
for config ($DOTFILES/zsh/*.zsh) source $config
unsetopt nomatch
# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
    # [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        # eval "$("$BASE16_SHELL/profile_helper.sh")"

# export TERM=xterm-256color

# Add GOPATH

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,0.0.0.0,10.0.0.0/8,192.168.10.0/2410.96.0.0/12,192.168.122.0/24,192.168.39.0/24"

    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\?\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi
        local proxy=$1
        export http_proxy="$proxy" \
               https_proxy=$proxy \
               ftp_proxy=$proxy \
               rsync_proxy=$proxy \
               all_proxy=$proxy
        echo "Proxy environment variable set."
        return 0
    fi

    echo -n "username: "; read username
    if [[ $username != "" ]]; then
        echo -n "password: "
        read -es password
        local pre="$username:$password@"
    fi

    echo -n "server: "; read server
    echo -n "port: "; read port
    local proxy=$pre$server:$port
    export http_proxy="$proxy" \
           https_proxy=$proxy \
           ftp_proxy=$proxy \
           rsync_proxy=$proxy \
           HTTP_PROXY=$proxy \
           HTTPS_PROXY=$proxy \
           FTP_PROXY=$proxy \
           RSYNC_PROXY=$proxy \
           ALL_PROXY=$proxy \
           all_proxy=$proxy
}

function proxy_off(){
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY ALL_PROXY all_proxy
    echo -e "Proxy environment variable removed."
}

generate_random () {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
}

zstyle :compinstall filename '/home/bohr/.zshrc'

eval "$(starship init zsh)"
autoload -U select-word-style
select-word-style bash

eval $(navi widget zsh)

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
cowsay -f $(cowsay -l | tail -n +2 | xargs -n1 | shuf -n 1) $(/usr/bin/whatis $(ls /usr/share/man/man1 | shuf -n 1 | cut -d. -f1) 2>/dev/null)
