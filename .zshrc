# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tim"  #"blinks"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
   # we're on a linux box
   alias alu='apt list --upgradable'

   function ccycle_bibliography_update()
   {
      cd $HOME/Documents/CCycleBibliography
      pandoc --citeproc --standalone $HOME/Documents/CCycleBibliography/CCycleBibliography.md -o $HOME/Documents/CCycleBibliography/CCycleBibliography.html  --metadata pagetitle="CCycle Bibliography"
      echo "wrote $HOME/Documents/CCycleBibliography/CCycleBibliography.html"
   }

   function sshfs_GNS_linux_home()
   {
      sshfs -o idmap=user $USER@raukawa:/home/timh ~/mnt/timh/
      echo "to unmount use: fusermount -u ~/mnt/timh"
   }

   function sshfs_GNS_scratch()
   {
      sshfs -o idmap=user $USER@raukawa:/scratch/ ~/mnt/scratch/
      echo "to unmount use: fusermount -u ~/mnt/scratch"
   }

   function sshfs_GNS_amp()
   {
      sshfs -o idmap=user $USER@raukawa:/amp ~/mnt/amp
      echo "to unmount use: fusermount -u ~/mnt/amp"
   }

   function sshfs_GNS_raukawa_code()
   {
      sshfs -o idmap=user $USER@raukawa:/home/timh/Code /home/timh/mnt/raukawa_code/
      echo "to unmount use: fusermount -u ~/mnt/raukawa_code"
   }

   function backup_to_GNS()
   # backup /home/timh to raukawa.gns.cri.nz
   #
   # $@ passes flags from the command line through - useful for
   # running with a "-n" to do a dry run
   {
	echo "syncing local home to raukawa.  flags: $@"
	rsync "$@" -Shavu --sparse --progress --delete-after --delete-excluded --exclude-from=$HOME/.backup_exclude --filter='protect .ssh' --filter='protect .backup_raukawa.log' --log-file=$HOME/.backup_log --log-file-format='%i %n%L %o' --remote-option=--log-file=/home/timh/.backup_raukawa.log /home/timh/ "raukawa:/home/timh/laptop_backup"
   }

   function backup_to_GNS_minimal()
   # backup /home/timh/Documents and /home/timh/Code to raukawa.gns.cri.nz
   #
   # $@ passes flags from the command line through - useful for
   # running with a "-n" to do a dry run
   {
	echo "syncing local ~/Documents/ and ~/Code/ to raukawa.  flags: $@"
	rsync "$@" -Shavu --sparse --progress --delete-after --delete-excluded --exclude-from=$HOME/.backup_exclude --filter='protect .ssh' --filter='protect .backup_raukawa.log' --log-file=$HOME/.backup_log --log-file-format='%i %n%L %o' --remote-option=--log-file=/home/timh/.backup_raukawa.log /home/timh/Documents/ "raukawa:/home/timh/laptop_backup/Documents"
	rsync "$@" -Shavu --sparse --progress --delete-after --delete-excluded --exclude-from=$HOME/.backup_exclude --filter='protect .ssh' --filter='protect .backup_raukawa.log' --log-file=$HOME/.backup_log --log-file-format='%i %n%L %o' --remote-option=--log-file=/home/timh/.backup_raukawa.log /home/timh/Code/ "raukawa:/home/timh/laptop_backup/Code"
    rsync "$@" -Shavu --sparse --progress --delete-after --delete-excluded --exclude-from=$HOME/.backup_exclude --filter='protect .ssh' --filter='protect .backup_raukawa.log' --log-file=$HOME/.backup_log --log-file-format='%i %n%L %o' --remote-option=--log-file=/home/timh/.backup_raukawa.log /home/timh/texmf/ "raukawa:/home/timh/laptop_backup/texmf"
   }

   function apt-get_history() {
       zcat /var/log/apt/history.log.*.gz | cat - /var/log/apt/history.log | grep -Po '^Commandline:(?= apt-get)(?=.* install ) \K.*' | sed '1,4d'
   }

   # suggestion from Ray Vercoelen email <2021-09-27 14:13>for dealing with DNS problems on the GNS VPN.
   alias setup_GNS_VPN_DNS='sudo resolvectl dns vpn 161.65.38.65 161.65.44.65 && resolvectl domain vpn gns.cri.nz corp.gns.cri.nz geonet.org.nz'
   alias panoply=/home/timh/Software/PanoplyJ/panoply.sh
   alias open='xdg-open'
   alias mount_GNS_I='sudo mount -t cifs -o user=timh,domain=gns //hut-win-smb.corp.gns.cri.nz/gnsshared$  /mnt/Idrive'
   alias mount_GNS_J='sudo mount -t cifs -o user=timh,domain=gns  //hut-win-smb.corp.gns.cri.nz/gnsfiles$  /mnt/Jdrive'
   alias mount_GNS_K='sudo mount -t cifs -o user=timh,domain=gns //hut-win-smb.corp.gns.cri.nz/scratch /mnt/Kdrive'
   export BIBINPUTS=~/texmf/bibtex/bib/
   export BSTINPUTS=~/texmf/bibtex/bst/
elif [[ "$OSTYPE" == "darwin"* ]]; then
   # Mac OSX
   alias dircolors='gdircolors'
   alias ls='gls --color=always'
   alias clear_clipboard='pbcopy < /dev/null'
   export SCREENRC=.screenrc_mac
   alias backup_database='rsync -havu --progress AWS_chatbot:/home/deploy/app/Data/meditation_users.db $HOME/Documents'
   alias remove_known_host='ssh-keygen -f "/Users/tim/.ssh/known_hosts" -R'
   export BIBINPUTS=~/texmf/Library/bibtex/bib/
   export BSTINPUTS=~/texmf/Library/bibtex/bst/
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

fpath+=/home/timh/Software/conda-zsh-completion

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git conda-zsh-completion conda)

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

## --------------------------------------------------
## vterm stuff
##
## vterm_printf() and vterm_prompt_end(), in combination, allow vterm (in emacs)
## to keep track of what directory it's in, use c-n and c-p to navigate prompts,
## etc.
##
## see https://github.com/akermu/emacs-libvterm/blob/master/README.md#directory-tracking-and-prompt-tracking
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
## end vterm stuff
## --------------------------------------------------

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
export WORKON_HOME=~/mambaforge/envs/   # for pyvenv-workon in emacs  https://github.com/jorgenschaefer/pyvenv
export PATH=/Library/TeX/texbin:$HOME/.config/emacs/bin:$HOME/bin:/usr/local/bin:$PATH
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

alias restart_gnome='/etc/init.d/gdm3 restart'
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

# make sure pyenv shims are at the beginning of $PATH
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/timh/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/timh/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/timh/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/timh/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/timh/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/timh/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

