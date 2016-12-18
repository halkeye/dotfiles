ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh
antigen bundle colored-man-pages
antigen bundle colorize

antigen-bundle npm
antigen-bundle ruby
antigen-bundle tmuxinator
antigen-bundle chruby
antigen-bundle docker
antigen-bundle pyenv
antigen-bundle catimg
antigen-bundle vagrant

antigen-theme aussiegeek

if [ "$OSTYPE"="darwin11.0" ]; then
  antigen-bundle osx
fi

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions src
antigen bundle lukechilds/zsh-nvm

antigen-apply

source ~/.shell/aliases
source ~/.shell/options
source ~/.shell/zshoptions

# direnv
eval "$(direnv hook $0)"
export PATH=/opt/apache-maven-3.3.9/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
source '/opt/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/opt/google-cloud-sdk/completion.zsh.inc'
