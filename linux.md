# linux tips(?)

## programs

- ulauncher
- [fusuma](https://github.com/iberianpig/fusuma)
- plank

## KBS VPN

- <https://cis.technion.ac.il/en/central-services/communication/off-campus-connection/ssl-vpn/pulse-secure-on-linux-alternative/>

## touch-and-drag-lock

- libinput Tapping Drag Lock Enabled
- in /usr/share/X11/xorg.conf.d/40-libinput.conf

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "TappingDragLock" "on"
EndSection
```

## touchscreen

- <https://wiki.archlinux.org/index.php/Touchscreen>
- in .xsessionrc

```bash
sleep 4 && xinput --map-to-output 'pointer:Atmel Atmel maXTouch Digitizer' "eDP-1" &
```

## kensington trackball (export mouse)

- <https://dcmru.tistory.com/2511056>
- check device name by : xinput list
- in /usr/share/X11/xorg.conf.d/10-evdev.conf

```
Section "InputClass"
	Identifier "Kensington      Kensington Expert Mouse"
	MatchProduct "Kensington      Kensington Expert Mouse"
	MatchIsPointer "on"
	MatchDevicePath "/dev/input/event*"
	Driver "evdev"
	Option "ButtonMapping" "3 8 1 4 5 6 7 9"
EndSection
```

## powerline font

- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

## WIFI issue

- <https://easylinuxtipsproject.blogspot.com/p/internet.html#ID2.2>
