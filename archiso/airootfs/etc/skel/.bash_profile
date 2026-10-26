#
# ~/.bash_profile - VibeOS Live Auto-Starter
# Muallif: backandchi | O'zbekiston
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Auto-start KDE Plasma GUI on TTY1
if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ]; then
    if [ "$(tty)" = "/dev/tty1" ] || [ "$XDG_VTNR" = "1" ]; then
        echo "🚀 VibeOS KDE Plasma yuklanmoqda..."
        export XDG_SESSION_TYPE=wayland
        export QT_QPA_PLATFORM=wayland
        export MOZ_ENABLE_WAYLAND=1
        export WLR_NO_HARDWARE_CURSORS=1
        # Launch KDE Plasma with fallback
        exec startplasma-wayland 2>/tmp/plasma.log || exec startplasma-x11
    fi
fi
