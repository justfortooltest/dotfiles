## Permission

```sh
sudo chmod 755 ./bootstrap.sh ./macOS.sh
```

## Start

`xcode-select --install` then

`./ubuntu.sh` or `./macOS.sh`


## Ubuntu

i3wm 

```shell
export PRIMARY="HDMI1"
export EXT1="VGA1"
# EXT2="DP-1"
#
xrandr --output $PRIMARY --primary --auto --output $EXT1 --left-of $PRIMARY
```
