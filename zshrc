skip_global_compinit=1
export ZPLUG_HOME="${HOME}/.zplug"

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source $ZPLUG_HOME/init.zsh && zplug update --self
fi
source $ZPLUG_HOME/init.zsh
autoload -U compinit && compinit -u -C -d "$ZPLUG_HOME/zcompdump"

zplug "creationix/nvm", use:nvm.sh
zplug "tj/git-extras", use:"etc/git-extras-completion.zsh", defer:3, if:"[[ $(command -v git) ]]"
zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh", defer:3, if:"[[ $(command -v tmuxinator) ]]"

zplug "denysdovhan/spaceship-zsh-theme", as:theme

zplug "bobsoppe/zsh-ssh-agent", use:"ssh-agent.zsh", from:github
zplug "zsh-users/zsh-completions", depth:1
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "lukechilds/zsh-better-npm-completion", defer:2


zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug check || zplug install
zplug load --verbose


if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - zsh --no-rehash)"
fi

#antigen bundle chruby
#antigen bundle docker
#antigen bundle pyenv
#antigen bundle catimg
#antigen bundle vagrant
#
##antigen theme aussiegeek
#antigen theme denysdovhan/spaceship-zsh-theme
#
#if [ "$OSTYPE"="darwin11.0" ]; then
#  antigen bundle osx
#fi
#
#antigen bundle unixorn/autoupdate-antigen.zshplugin
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle zsh-users/zsh-completions src
#antigen bundle lukechilds/zsh-nvm
#
#antigen apply

source ~/.shell/aliases
source ~/.shell/options
source ~/.shell/zshoptions

# direnv
eval "$(direnv hook $0)"
[ -f /opt/apache-maven-3.3.9 ] && sexport PATH=/opt/apache-maven-3.3.9/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
[ -f /opt/google-cloud-sdk ] && source '/opt/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
[ -f /opt/google-cloud-sdk ] && source '/opt/google-cloud-sdk/completion.zsh.inc'
