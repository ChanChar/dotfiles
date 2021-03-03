# Base directory for zsh configs
ZSH_BASE=$HOME/dotfiles

# Load Antigen
# https://github.com/zsh-users/antigen
source $ZSH_BASE/antigen/antigen.zsh

source ~/.aliases
source ~/.functions

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Similar to Vundle, bundle install plugins.
## Terminal helpers
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

## Javascript
antigen bundle node
antigen bundle npm

## Ruby / Rails
antigen bundle rails
antigen bundle ruby

## OS specific plugins
case `uname` in
  Darwin)
    # Commands for OS X go here
    antigen bundle osx
  ;;
  Linux)
    # Commands for Linux go here
  ;;
  Windows)
    # Commands for Windows go here
  ;;
esac

## Theme / Styling
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
antigen theme robbyrussell

# Apply antigen configs
antigen apply


export TERM="xterm-256color"

# Other zsh settings

## Enable command auto-correction.
ENABLE_CORRECTION="true"

## Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export EDITOR="vim"

# Work specific actions
## Shopify `dev`
if [[ -z $SHOPIFY_DEV_SETUP ]]; then
  [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
  if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
fi