''
  bindsym $mod+Shift+c reload
  bindsym $mod+Shift+r restart

  bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5%
  bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5%
  bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle

  bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
  bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

  bindsym XF86TouchpadToggle exec toggletouchpad.sh # toggle touchpad

  bindsym XF86AudioPlay exec playerctl play
  bindsym XF86AudioPause exec playerctl pause
  bindsym XF86AudioNext exec playerctl next
  bindsym XF86AudioPrev exec playerctl previous
''
