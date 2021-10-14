
#!/bin/sh

theme="dracula"
case $theme in
    "dracula")
        color_bg="#282a36"
        color_fg="#FFFFFF"
        color_hl1="#000000"
        color_hl2="#1d2021"
        ;;
    *) # Default to Nord
        color_bg="#2e3440"
        color_fg="#eceff4"
        color_hl1="#5e81ac"
        color_hl2="#81a1c1"
        ;;
esac
