''
  assign [class="vesktop"] 3
  assign [class="discord"] 3
  assign [class="firefox" title="(?i)youtube"] 4

  exec --no-startup-id dex --autostart --environment i3
  exec --no-startup-id nm-applet
  exec --no-startup-id vesktop

  bindsym $mod+Return exec kitty
  bindsym $mod+d exec --no-startup-id rofi
''
