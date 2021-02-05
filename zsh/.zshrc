# Variables
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/bin"
export _JAVA_AWT_WM_NONREPARENTING=1
# [Loads pyenv automatically]
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Configuration
ZSH_THEME="spaceship"
autoload -U promptinit; promptinit
plugins=(git)
source $ZSH/oh-my-zsh.sh
COMPLETION_WAITING_DOTS="true"


# Aliases
# [Text scaling factor for diff monitors [GNOME]]
alias external_mon='gsettings set org.gnome.desktop.interface text-scaling-factor 1'
alias internal_mon='gsettings set org.gnome.desktop.interface text-scaling-factor 1.2'

# [Set keyboard layout change to capslock]
alias keyboard='setxkbmap -option grp:switch,grp:caps_toggle,grp_led:caps us,ua'

# [Open vpn aliases]
alias vpn_on='sudo systemctl start openvpn-client@TunnelBearUnitedStates'
alias vpn_off='sudo systemctl stop openvpn-client@TunnelBearUnitedStates'
alias vpn_status='sudo systemctl status openvpn-client@TunnelBearUnitedStates'

# [Ranger]
alias rr='ranger'

# [Search]
alias ff='fzf'
