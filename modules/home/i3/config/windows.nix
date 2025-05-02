''
  floating_modifier $mod
  tiling_drag modifier

  focus_follows_mouse no
  focus_wrapping no

  bindsym $mod+Shift+q kill

  bindsym $mod+space focus mode_toggle
  bindsym $mod+a focus parent

  bindsym $mod+j focus left
  bindsym $mod+k focus down
  bindsym $mod+l focus up
  bindsym $mod+semicolon focus right

  bindsym $mod+Left focus left
  bindsym $mod+Down focus down
  bindsym $mod+Up focus up
  bindsym $mod+Right focus right

  bindsym $mod+Shift+j move left
  bindsym $mod+Shift+k move down
  bindsym $mod+Shift+l move up
  bindsym $mod+Shift+semicolon move right

  bindsym $mod+Shift+Left move left
  bindsym $mod+Shift+Down move down
  bindsym $mod+Shift+Up move up
  bindsym $mod+Shift+Right move right

  bindsym $mod+h split h
  bindsym $mod+v split v

  bindsym $mod+f fullscreen toggle
  bindsym $mod+Shift+f floating toggle

  bindsym $mod+e layout toggle split

  mode "resize" {
          bindsym j resize shrink width 5 px or 5 ppt
          bindsym k resize grow height 5 px or 5 ppt
          bindsym l resize shrink height 5 px or 5 ppt
          bindsym semicolon resize grow width 5 px or 5 ppt

          bindsym Left resize shrink width 5 px or 5 ppt
          bindsym Down resize grow height 5 px or 5 ppt
          bindsym Up resize shrink height 5 px or 5 ppt
          bindsym Right resize grow width 5 px or 5 ppt

          bindsym Return mode "default"
          bindsym Escape mode "default"
          bindsym $mod+r mode "default"
  }

  bindsym $mod+r mode "resize"
''
