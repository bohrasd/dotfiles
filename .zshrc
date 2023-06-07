export DOTFILES=$HOME/.dotfiles
# If you come from bash you might have to change your $PATH.
export PATH=$DOTFILES/bin:$HOME/bin:$HOME/.nix-profile/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.composer/vendor/bin/:$HOME/go/bin:$HOME/Library/Python/3.8/bin:$HOME/.local/share/containers/podman-desktop/extensions-storage/compose/bin:$PATH


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

#setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=zh_CN.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

#export ZSH_CACHE_DIR=~/.dotfiles/zsh/my-site-functions

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

generate_random () {
  #cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
  cat /dev/urandom | tr -dc 'a-zA-Z0-9_\-&?!%$#@*' | fold -w ${1:-32} | head -n 1
}

#autoload -U select-word-style
#select-word-style bash

eval $(navi widget zsh)

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
#cowsay -f $(cowsay -l | tail -n +2 | xargs -n1 | shuf -n 1) $(/usr/bin/whatis $(ls /usr/share/man/man1 | shuf -n 1 | cut -d. -f1) 2>/dev/null) :\)

#autoload -U +X compinit && compinit -i

#bindkey -e

#cowsay -f $(cowsay -l | tail -n +2 | xargs -n1 | shuf -n 1) $(/usr/bin/apropos -s 2 . | shuf -n 1 ) :\)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zhangzheyuan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhangzheyuan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zhangzheyuan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhangzheyuan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
