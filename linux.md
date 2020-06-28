# useful programs

- ulauncher
- [fusuma](https://github.com/iberianpig/fusuma)
- plank

# kensington trackball (slimblade)

- https://dcmru.tistory.com/2511056
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
EndSection```
