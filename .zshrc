# Git Prompt Info
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' formats '%u%c%b'
zstyle ':vcs_info:git:*' actionformats '%a|%u%c%v'

# Prompt Configuration
LASTEXIT="%B(%(?.%F{green}√.%F{red}%?)%f)%b"
PROMPT="$LASTEXIT%B%F{blue}[%*]%F{green}[%n:%1~]%f%b%# "

RPROMPT='${vcs_info_msg_0_}'

# Path additions
export PATH="$PATH:$HOME/.docker/bin"
export PATH="$HOME/homebrew/bin:$PATH"
export PATH="$HOME/homebrew/sbin:$PATH"
export PATH="$HOME/homebrew/opt/ruby/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# nvm setup
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Git completions
autoload -Uz compinit && compinit

plugins+=(ssh-agent)

# Load custom functions
for file in ~/.zshrc.d/*.(zsh|sh); do
  source $file
done

# Start screen
test -n "$STY" || test "$TERM_PROGRAM" = "vscode" || screen

settitle()
{
  titlestart='\033k'
  titlefinish='\033\'
  printf "${titlestart}$*${titlefinish}"
}

screen_precmd()
{
  settitle "$(basename $(print -P %~))"
}

screen_preexec()
{
  settitle "${2[(w)1]}"
}

precmd_functions+=( screen_precmd )
preexec_functions+=( screen_preexec )

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/patricklange/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/patricklange/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patricklange/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patricklange/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
