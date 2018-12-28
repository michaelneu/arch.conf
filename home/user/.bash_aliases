alias pkglist='pacman -Qqen'
alias suspend='systemctl suspend'
alias select-wallpaper='feh --action "feh --bg-fill %f && kill %V" --title "FEH - WALLPAPER" --recursive --auto-zoom --geometry 960x540 /home/michael/Pictures/Wallpapers'
alias compton-restart='killall compton && grep compton $HOME/.xinitrc'
