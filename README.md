# Treeshot

L3af's mediocre screenshot tool. (Totally not just a wrapper around Maim and ImageMagick)

## Requirements

- [Slop](https://github.com/naelstrof/slop)
- [ImageMagick](https://github.com/ImageMagick/ImageMagick)

## Examples

Screenshot a region and copy to clipboard with a border of 10 pixels colored red.
    $ treeshot -s -w10 -b\#FF0000

Screenshot a region and copy to clipboard without adding a border.
    $ treeshot -sd

Screenshot a region and save to selection.png
    $ treeshot -s > selection.png

## Args
  `-h`  Show this help menu<br>
  `-s`  Select region to screenshot (fullscreen by default)<br>
  `-b`  Disable border (enabled by default)<br>
  `-c`  Border color (#EDD7BD by default)<br>
  `-w`  Border width (4 by default)<br>
  `-d`  Capture delay in ms<br>
  `-e`  Execute shell after capturing (Use `$file` to access the file)<br>
  
## Install

    $ sudo ./install.sh

