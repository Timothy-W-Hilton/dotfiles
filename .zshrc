# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="duellj"  #"blinks"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   # we're on a linux box
     function apt-get_history() {
          zcat /var/log/apt/history.log.*.gz | cat - /var/log/apt/history.log | grep -Po '^Commandline:(?= apt-get)(?=.* install ) \K.*' | sed '1,4d'
	  }

elif [[ "$OSTYPE" == "darwin"* ]]; then
     # Mac OSX
     alias dircolors='gdircolors'
     alias ls='gls --color=always'
     alias clear_clipboard='pbcopy < /dev/null'
     export SCREENRC=.screenrc_mac
     alias backup_database='rsync -havu --progress AWS_chatbot:/home/deploy/app/Data/meditation_users.db $HOME/Documents'
     alias remove_known_host='ssh-keygen -f "/Users/tim/.ssh/known_hosts" -R'
fi
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git,
	pyenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# ==================================================
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/tim/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall
# ==================================================

# begin Tim additions

autoload -U zmv
zmodload zsh/stat


function rsync_nersc()
{
	echo "rsync -havu \"nersc_data_xfer:$1\" . "
	rsync -havu --progress "nersc_data_xfer:$1" .
}

function rsync_nersc_open()
{
	echo "rsync -havu \"nersc_data_xfer:$1\" . && open `basename $1`"
	rsync -havu "nersc_data_xfer:$1" . && open `basename $1`
}


function kill_nersc_ssh_old()
{
	kill $(ps aux | grep 'ssh nersc_\(edison\|cori\|hopper\)' | awk '{print $2}')
}

function png_animate()  {
    # usage: png_animate 'files_to_animate_glob_string' 'name_of_output.mp4'
    ffmpeg -nostdin -r 2 -pattern_type glob  -i "$1" -c:v libx264 -pix_fmt yuv420p "$2"
}

function kill_nersc_ssh()
{
	kill $(ps aux | grep 'ssh\( -[XY] \| \)nersc_\(edison\|cori\|hopper\)' | awk '{print $2}')
}


# use regular expressions for backward command search
bindkey '^R' history-incremental-pattern-search-backward

# set some environment variables
export BIBINPUTS=~/Library/texmf/bibtex/bib/
export BSTINPUTS=~/Library/texmf/bibtex/bst/
export PATH=/Library/TeX/texbin:$HOME/bin:/usr/local/bin:$PATH
# use decent colors for colorized grep output
export GREP_COLOR='0;40;31'
export SARIKA_INPUT=~/work/Data/STEM/input/
export WORK=$HOME/work
export NERSCHOME=/Users/tim/work/NERSC_home/
export NERSCSCRATCH=/Users/tim/work/NERSC_scratch/
export PREVIEW=/Applications/Preview.app
# needed to allow homebrew formulae to use mono -- probably
# unecessary.  Mono is a dependency of duplicati.
export MONO_GAC_PREFIX="/usr/local"
# use solarized colors for ls
eval `dircolors $HOME/Software/dircolors-solarized/dircolors.ansi-dark`

# alias emacs='/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs'

alias sr='screen -r '
alias srd='screen -DR'
alias sls='screen -ls'
alias screenbackground='screen -S background -c ~/.screenrc_background'
alias anyconnect=/opt/cisco/anyconnect/bin/vpn
alias rm='rm -i'
alias lessr='less -r'  #interpret color codes correctly
alias gmail='source /Users/tim/venv_mutt/bin/activate && neomutt -F ~/.muttrc_gmail_new -f ~/Mail/Gmail/INBOX'
alias tim_mail='source /Users/tim/venv_mutt/bin/activate && mutt -F .muttrc_protonmail'
alias gmail_online='neomutt -F ~/.muttrc_gmail_new'
alias sqs_edison='ssh nersc_edison "/usr/common/software/bin/sqs -u twhilton"'
alias ec='emacsclient -n'
alias rsync='rsync --progress'
alias linux_tower_firefox='ssh -YC4c arcfour,blowfish-cbc tim@linux_tower firefox -no-remote'
alias yakyak="cd $HOME/Software/yakyak && npm run electron app &"
alias diceware="gshuf --random-source=/dev/random -rn6 < $HOME/Documents/eff_large_wordlist.txt"
alias nersc_ssh_generate_key="$HOME/bin/nersc_mfa_sshproxy.sh -u twhilton"

alias gbavv='git branch -a -vv'
alias gdbw='git diff -b -w'
alias glola10="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all | head "

# "--color=always" causes grep not to disable color output when writing to a pipe.
alias cgrep='grep --color=always'
#alias rdesktop_jemez='rdesktop -u Tim 129.24.144.165 -r clipboard:PRIMARYCLIPBOARD -g 100% -KD'
#noappledouble prevents OSX from writing .DS_Store files on remote system
alias mount_ecampbell_plots='sshfs -p 22 campbell_lab:/home/thilton/Plots/ ~/ecampbell300_plots -oauto_cache,reconnect,noappledouble'
alias mount_ecampbell_home='sshfs -p 22 campbell_lab:/home/thilton/ ~/work/ecampbell300_Home -oauto_cache,reconnect,noappledouble'
alias mount_workaround='sshfs -p 22 workaround:/home/ecampbell_lab/ ~/work/workaround -oauto_cache,reconnect,noappledouble'
#alias mount_NERSC_home='sshfs -p 22 hopper:/global/homes/t/twhilton/ ~/work/NERSC_home -oauto_cache,reconnect,noappledouble,follow_symlinks'
alias mount_NERSC_home_edison='sshfs nersc_edison:/global/homes/t/twhilton/ ~/work/NERSC_home -oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead'
alias mount_NERSC_project_edison='sshfs nersc_edison:/project/projectdirs/m2319 ~/work/NERSC_Project -oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead'
alias mount_NERSC_project_cori='sshfs nersc_cori:/project/projectdirs/m2319 ~/work/NERSC_Project -oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead'
alias mount_NERSC_home='sshfs nersc_cori:/global/homes/t/twhilton/ ~/work/NERSC_home -oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead'
alias mount_NERSC_scratch_cori='sshfs nersc_data_xfer:/global/cscratch1/sd/twhilton/ ~/work/NERSC_scratch -oauto_cache,reconnect,defer_permissions,noappledouble,nolocalcaches,no_readahead'
#'sshfs nersc_cori:/global/homes/t/twhilton/ ~/work/NERSC_home -oauto_cache,reconnect,noappledouble'

# make sure pyenv shims are at the beginning of $PATH
eval "$(pyenv init --path)"

# Created by `pipx` on 2021-04-02 19:34:05
export PATH="$PATH:/Users/tim/.local/bin"
