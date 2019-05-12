exec feh --bg-scale  -g 1920x1440 '/home/user/Pictures/pic.jpg'
exec --no-startup-id compton

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# .config/i3/config


#get from .Xresources
#                       i3_name     x_name      fallback
set_from_resource       $fg         foreground  #f0f0f0
set_from_resource       $urgent     color1      #f50000
set_from_resource       $bg         background  #000000
set_from_resource       $selected   color8      #707070
set_from_resource       $border     color8      #1234ff     

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:RobotoMono 8, Font Awesome 11
# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec termite

# kill focused window
bindsym $mod+Shift+a kill

# start rofi
bindsym $mod+d exec rofi -show run

# start firefox
bindsym $mod+x exec firefox

# i3 lock


# change focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

#workspace variables
#set $ws1 "1 "
#set $ws2 "2 "
#set $ws3 "3 "
#set $ws4 "4 "

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
#bar {
#    tray_output primary
#    position top
#    status_command i3blocks -c ~/.config/i3blocks/i3blocks.conf
#
#    colors {
#        background $bg
        #                   border      background  text 
#        focused_workspace   $selected   $selected  $fg
#        urgent_workspace    $urgent     $urgent    $fg
#        inactive_workspace  $bg         $bg        $fg     
#    }
#}

# enable touchpad
exec --no-startup-id xinput set-prop 9 278 1

# start redshift
exec --no-startup-id redshift

#screenshot
bindsym Print exec mate-screenshot

# adjust brightness
#bindsym XF86MonBrightnessUp exec xbacklight -inc 10
#bindsym XF86MonBrightnessDown exec xbacklight -dec 10

#adjust volume
bindsym XF86AudioLowerVolume exec pactl set-sink-volume 0 -5%
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume 0 +5%
bindsym XF86AudioMute exec pactl set-sink-mute 0 toggle



#set wallpaper
exec_always --no-startup-id feh --bg-fill ~/Images/image.jpg

# start compton
exec_always --no-startup-id compton --config ~/.config/compton/compton.conf

# mate
exec_always --no-startup-id nm-applet
exec_always --no-startup-id blueman-applet
exec --no-startup-id mate-power-manager
exec --no-startup-id mate-settings-daemon 

# gaps
gaps inner 7
#gaps outer 6

# disable window title
for_window [class="^.*"] border pixel 0


# enable authentication agent
exec_always --no-startup-id mate-polkit

# start dunst with configuration
exec_always --no-startup-id dunst -conf ~/.config/dunst/dunstrc

#set wallpaper for betterlockscreen
exec_always --no-startup-id source ~/.fehbg 


#window color
#                       border   background  text    indicator  child_border
#client.focused          $border  $bg         $fg     $border    $border
#client.focused_inactive $bg      $bg         $fg     #12ff34    $border    
#client.background       $bg

bar {
        status_command i3status
}

