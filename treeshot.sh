#! /bin/bash

selection=0
showCursor=1
addBorder=1
borderWidth=4
borderColor="#EDD7BD"

function showHelp {
    echo "  Treeshot - L3af's Mediocre Screenshot Wrapper"
    echo " "
    echo " Args"
    echo "   -h  Show this help menu"
    echo "   -s  Select region to screenshot (fullscreen by default)"
    echo "   -c  Show mouse in the screenshot (disabled by default)"
    echo "   -d  Disable border (enabled by default)"
    echo "   -b  Border color (#EDD7BD by default)"
    echo "   -w  Border width (4 by default)"
    echo " "
}

while getopts ":schdb:w:" arg; do
    case $arg in
        s) selection=1;;
        c) showCursor=0;;
        d) addBorder=0;;
        b) borderColor="${OPTARG}";;
        w) borderWidth="${OPTARG}";;
        h) showHelp; exit;;
    esac
done

# Get maim args
ARGS="$(if [ $selection -eq 1 ]; then echo s; fi)$(if [ $showCursor -eq 1 ]; then echo u; fi)"

# Take screenshot without cursor
maim -$ARGS > /tmp/.treeshot.png

if [ $addBorder -eq 1 ]; then
    # Add border and shadow
    convert /tmp/.treeshot.png -bordercolor $borderColor -border $borderWidth /tmp/.treeshot.png
fi

# Copy to clipboard
xclip -selection clipboard -t image/png /tmp/.treeshot.png

# Remove file
rm /tmp/.treeshot.png

# # One liner
# maim -su | convert - -bordercolor '#EDD7BD' -border 4 /tmp/.treeshot.png; xclip -selection clipboard -t image/png /tmp/.treeshot.png; rm /tmp/.treeshot.png
