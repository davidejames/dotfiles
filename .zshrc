
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

autoload -Uz promptinit && promptinit && prompt powerlevel10k
#-------------------------------------------------------------------------------


#-----------------------------------------------------------------------
# Dot Net
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet
#-----------------------------------------------------------------------

fpath+=${ZDOTDIR:-~}/.zsh_functions

source ~/.zshrc-local

# zsh-vi-ode will overwrite some commands, sowe need to have it allow other
# inits after it is done:
# per: https://github.com/jeffreytse/zsh-vi-mode#execute-extra-commands
function my_init() {
    # init FZF:
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # -- use fd instead of default find
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

    _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
    }

    _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
    }

    source ~/fzf-git.sh/fzf-git.sh
}
zvm_after_init_commands+=(my_init)

if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

function init_lazyman() {
    # Source the Lazyman shell initialization for aliases and nvims selector
    # shellcheck source=.config/nvim-Lazyman/.lazymanrc
    [ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
    # Source the Lazyman .nvimsbind for nvims key binding
    # shellcheck source=.config/nvim-Lazyman/.nvimsbind
    [ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#zprof

