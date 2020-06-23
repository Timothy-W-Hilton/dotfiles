# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   # we're on a linux box
elif [[ "$OSTYPE" == "darwin"* ]]; then
     # Mac OSX
     alias dircolors='gdircolors'
     alias ls='gls --color=always'
     alias emacs='/usr/local/Cellar/emacs/25.3/bin/emacs'
     alias emacsclient='/usr/local/Cellar/emacs/25.3/bin/emacsclient'
     alias screen='/usr/local/Cellar/screen/4.6.2/bin/screen'
     export SCREENRC=.screenrc_mac

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
plugins=(git)

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
export PATH=/Library/TeX/texbin:$HOME/bin:$PATH:/Applications/Inkscape.app/Contents/Resources/bin:/usr/local/bin
# use decent colors for colorized grep output
export GREP_COLOR='0;40;31'
export SARIKA_INPUT=~/work/Data/STEM/input/
export WORK=$HOME/work
export NERSCHOME=/Users/tim/work/NERSC_home/
export NERSCSCRATCH=/Users/tim/work/NERSC_scratch/
export PREVIEW=/Applications/Preview.app

# use solarized colors for ls
eval `dircolors $HOME/Software/dircolors-solarized/dircolors.ansi-dark`

# alias emacs='/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs'

alias sr='screen -r '
alias sls='screen -ls'
alias screenemacs='screen -S emacs -c ~/.screenrc_empty'
alias anyconnect=/opt/cisco/anyconnect/bin/vpn
alias rm='rm -i'
alias lessr='less -r'  #interpret color codes correctly
alias gmail='mutt -F ~/.muttrc_gmail_new -f ~/Mail/Gmail/INBOX'
alias gmail_online='mutt -F ~/.muttrc_gmail_new'
alias mercedmail='mutt  -F ~/.muttrc_merced -f /Users/tim/Mail/UC_Merced/INBOX'
alias mercedmail_online='mutt -F ~/.muttrc_merced_online'
alias sqs_edison='ssh nersc_edison "/usr/common/software/bin/sqs -u twhilton"'
alias ec='emacsclient -n'
alias rsync='rsync --progress'
alias linux_tower_firefox='ssh -YC4c arcfour,blowfish-cbc tim@linux_tower firefox -no-remote'
alias yakyak="cd $HOME/Software/yakyak && npm run electron app &"
alias diceware="gshuf --random-source=/dev/random -rn6 < $HOME/Documents/eff_large_wordlist.txt"
alias nersc_ssh_generate_key="$HOME/Software/NERSC-MFA/sshproxy.sh -u twhilton"

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

if [[ "$OSTYPE" == "darwin"* ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/tim/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
	eval "$__conda_setup"
    else
	if [ -f "/Users/tim/anaconda3/etc/profile.d/conda.sh" ]; then
	    . "/Users/tim/anaconda3/etc/profile.d/conda.sh"
	else
	    export PATH="/Users/tim/anaconda3/bin:$PATH"
	fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
else

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/tim/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/tim/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/tim/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/tim/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi