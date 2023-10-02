{ pkgs, ... }:

# Created By @saravenpi
# Edited and ported to Nix by Micka_R

let

  bg = "#282a36";
  fg = "#f8f8f2";
  black = "#3B4252";
  red = "#ff5555";
  green = "#50fa7b";
  yellow = "#f1fa8c";
  blue = "#bd93f9";
  magenta = "#ff79c6";
  cyan = "#8be9fd";
  white = "#E5E9F0";

  cat-black = "#161320";
  cat-white = "#D9E0EE";
  cat-red = "#F28FAD";
  cat-green = "#ABE9B3";
  cat-peach = "#F8BD96";
  cat-blue = "#96CDFB";
  cat-pink = "#F5C2E7";
  cat-mauve = "#DDB6F2";

  altblack = "#4C566A";
  altred = "#BF616A";
  altgreen = "#A3BE8C";
  altyellow = "#EBCB8B";
  altblue = "#81A1C1";
  altmagenta = "#B48EAD";
  altcyan = "#8FBCBB";
  altwhite = "#ECEFF4";

  shade-1 = "#32344a";
  shade-2 = "#444b6a";
  shade-3 = "#787c99";
  shade-4 = "#CACACE";
  shade-5 = "#acb0d0";


in {
  services.polybar = {
    enable = true;

    #script = "polybar -q -r top";
    script = "";
    config = {
      "global/wm" = {
        margin-bottom = 0;
      };

      #====================BARS====================#

      "bar/top" = {
        bottom = false;
        top = true;
        fixed-center = true;

        width = "100%";
        height = 40;
        offset-y = "0%";

        scroll-up = "i3wm-wsnext";
        scroll-down = "i3wm-wsprev";

        background = bg;
        foreground = fg;

        enable-ipc = true;

        font-0 = "JetBrains Mono Nerd Font:style=Medium:size=11;2";
        font-1 = "JetBrains Mono Nerd Font:style=Bold:size=11;2";
        font-2 = "JetBrainsMono Nerd Font:size=19;5";
        font-3 = "Material Icons Outlined:9;4";
        font-4 = "Material Icons Round:9;4";
        font-5 = "Source Han Sans CN:size=9;2";
        font-6 = "Iosevka Nerd Font:size=18;4";

        tray-position = "left";
        tray-background = "#725AC1";
        modules-left = "distro-icon i3 title";
        modules-center = "date";
        modules-right = "pulseaudio spacing spacing battery spacing spacing powermenu spacing spacing wlan spacing spacing";
        cursor-click = "pointer";
        locale = "en_US.UTF-8";
      };


      "settings" = {
        screenchange-reload = true;
      };

      #--------------------MODULES--------------------"

      "module/distro-icon" = {
        type = "custom/script";
        exec =
          "${pkgs.coreutils}/bin/uname -r | ${pkgs.coreutils}/bin/cut -d- -f1";
        interval = 999999999;

        format = " <label>";
        format-foreground = fg;
        format-background = bg;
        format-padding = 1;
        label = "%output%";
        label-font = 2;
      };

      "module/battery" = {
        type = "internal/battery";
        full-at = 98; # to disable it
        battery = "BAT0"; # TODO: Better way to fill this
        adapter = "ACAD";
        poll-interval = 2;
        
        format-charging = " <label-charging>";
        label-charging = "%percentage:2%% + %consumption%"; 
        format-foreground = cat-peach;
        format-charging-padding = 0;
        format-charging-foreground = cat-peach;

        format-discharging = "<ramp-capacity> <label-discharging>";
        label-discharging = "%percentage%%-%consumption%W";
        format-discharging-foreground = cat-peach;
        format-full-prefix = "  ";
        format-full-foreground = cat-peach;
        format-full-padding = 0;
        ramp-capacity-0 = " ";
        ramp-capacity-1 = " ";
        ramp-capacity-2 = " ";
        ramp-capacity-3 = " ";
        ramp-capacity-4 = " ";
        ramp-capacity-0-foreground = cat-red;
        animation-charging-framerate = 910;
        format-discharging-padding = 0;

      };

      "module/date" = {
        type = "internal/date";

        interval = "1.0";

        time = "%a, %b %d %H:%M:%S";

        format = "<label>";
        format-padding = 0;
        format-foreground = cat-green;

        label = "%{T1}%time%%{T-}";
        label-padding = 1;
        format-prefix = "%{T5}%{T-}";
      };

      "module/i3" = {
        type = "internal/i3";
        wrapping-scroll = false;
        index-sort = true;
        fuzzy-match = true;
        strip-wsnumbers = true;
        pin-workspaces = true;
        format = "<label-state> <label-mode>";
        format-background = cat-blue;

        ws-icon-default = "";

        label-mode-padding = 1;
        label-mode-foreground = cat-black;
        label-mode-background = cat-peach;

        label-unfocused = "%icon% %name%";
        label-unfocused-foreground = altblack;
        label-unfocused-padding = 1;

        label-focused = "%icon% %name%";
        label-focused-background = cat-mauve;
        label-focused-foreground = altblack;
        label-focused-padding = 1;

        label-visible = "%index%";
        label-visible-background = cat-peach;
        label-visible-foreground = altblack;
        label-visible-underline = cat-blue;
        label-visible-padding = 1;

        label-urgent = "!%index%";
        label-urgent-background = cat-red;
        label-urgent-foreground = cat-black;
        label-urgent-padding = 1;

        label-separator = "|";
      };

      "module/powermenu" = {
        type = "custom/menu";
        expand-right = false;
        expand-left = true;

        format = "<label-toggle> <menu>";
        format-background = bg;
        format-padding = 1;

        label-open = "";
        label-close = "";
        label-separator = "  ";

        menu-0-0 = " Suspend";
        menu-0-0-exec = "systemctl suspend";
        menu-0-1 = " Reboot";
        menu-0-1-exec = "reboot";
        menu-0-2 = " Shutdown";
        menu-0-2-exec = "systemctl poweroff";
      };

      "module/pulseaudio" = {

        type = "internal/pulseaudio";
        use-ui-max = false;
        format-volume = "<label-volume>";
        format-volume-padding = 0;
        format-volume-prefix = "%{T4}%{T-}";
        format-volume-prefix-foreground = cat-red;
        label-volume = "%{T1}%percentage%%%{T-}";
        label-volume-foreground = cat-red;
        label-volume-padding = 0;
        format-muted = "<label-muted>";
        format-muted-padding = 0;
        format-muted-prefix = "";
        format-muted-prefix-foreground = cat-red;
        label-muted = "%{T1}%percentage%%%{T-}";
        label-muted-foreground = cat-red;
        label-muted-padding = 0;
        click-right = "pavucontrol&";
      };

      "module/wlan" = {
        type = "internal/network";
        interface = "wlp0s20f3";
        interval = 1;
        format-connected = "<label-connected>";
        format-connected-padding = 0;
        label-connected = "%{A1:wifimenu:}%essid%%{A}";
        label-connected-foreground = cat-pink;
        label-connected-padding = 0;
        format-disconnected = "<label-disconnected>";
        format-disconnected-padding = 0;
        label-disconnected = "%{A1:wifimenu:}%{A}";
        label-disconnected-foreground = "cat-pink";
        label-disconnected-padding = 0;
        };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        format-padding = 1;
        format-foreground = fg;
        label = " %title%";
        label-maxlen = 30;
        label-empty = "Desktop";
        };

      "module/spacing" = {
        type = "custom/text";
        content = " ";
        content-foreground = bg;
        content-background = bg;
        };
      };
    };
  }

