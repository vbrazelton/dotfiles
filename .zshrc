# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath=(~/.zsh/completions $fpath)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="vinniebrazelton"
DISABLE_AUTO_TITLE="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# Load bash completion functions
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
 
# Initialize kubectl (and the alias k) auto completion
source <(kubectl completion zsh)
 
# Initialize kconfig shell functions and auto completion
#. ~/products/kconfig/setup/kconfig-setup.sh
 
# Git and other command line completions for tools installed by brew.
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
 
# aws command-line completion
complete -C /usr/local/bin/aws_completer aws

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='nvim'



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/vinniebrazelton/.docker/cli-plugins/ || true # Added by Docker Desktop

# Useful aliases
alias fman="compgen -c | fzf | xargs man"
alias kdp="kubectl get pods -A --no-headers | fzf | awk '{print \$2, \$1}' | xargs -n 2 sh -c 'kubectl describe pod \$0 -n \$1'"
alias kfl="kubectl get pods -A --no-headers | fzf | awk '{print \$2}' | xargs -n 2 sh -c 'kubectl logs -f \$0'"
alias ksc="kubectl config get-contexts -o name | fzf | awk '{print \$0}'| xargs -n 1 sh -c 'kubectl config use-context \$0'"


# GoLang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# bun completions
[ -s "/Users/vinniebrazelton/.bun/_bun" ] && source "/Users/vinniebrazelton/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#for config_file ($HOME/.zshrc.d/*); do
#    echo "Loading $config_file"
#    source $config_fileu
#done
#seval "$(atuin init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/vinniebrazelton/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/vinniebrazelton/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/vinniebrazelton/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/vinniebrazelton/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$PATH:/Users/vinniebrazelton/git/justins-bin";
source /Users/vinniebrazelton/urls/.databus

alias databricks-euc1='export DATABRICKS_URL=https://inmoment-prod-euc1-rev.cloud.databricks.com; export DATABRICKS_APIKEY=`databricks -p prod.euc1 auth token | jq .access_token -r`;'
alias databricks-usw2='export DATABRICKS_URL=https://inmoment-usw2-prod.cloud.databricks.com; export DATABRICKS_APIKEY=`databricks -p prod.usw2 auth token | jq .access_token -r`;'
alias databricks-apse2='export DATABRICKS_URL=https://inmoment-apse2-prod.cloud.databricks.com; export DATABRICKS_APIKEY=`databricks -p prod.apse2 auth token | jq .access_token -r`;'


# CREDENTIALS ALIASES
# DataBus
databus-demo() {
    export DATABUS_CREDS="databusAdmin:$(pass show databus/demo/databus_admin_password)"
    export DATABUS_URL="$DATABUS_URL_DEMO"
}

databus-usw2() {
    export DATABUS_CREDS="databusAdmin:$(pass show databus/prod.usw2/databus_admin_password)"
    export DATABUS_URL="$DATABUS_URL_PROD_USW2"
}

databus-euc1() {
    export DATABUS_CREDS="databusAdmin:$(pass show databus/prod.euc1/databus_admin_password)"
    export DATABUS_URL="$DATABUS_URL_PROD_EUC1"
}

databus-apse2() {
    export DATABUS_CREDS="databusAdmin:$(pass show databus/prod.apse2/databus_admin_password)"
    export DATABUS_URL="$DATABUS_URL_PROD_APSE2"
}

