{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        indicate_hidden = "yes";
        shrink = "no";
        separator_height = 1;
        padding = 10;
        horizontal_padding = 10;
        frame_width = 0;
        #frame_color = "#232323";
        #separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        #font = "Roboto";
        line_height = 0;
        markup = "full";
        format = "<span><b>%s %p</b></span>\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        max_icon_size = 48;
        icon_path = "/usr/share/icons/Numix-Circle/48x48/apps/";
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        corner_radius = 0;
        force_xinerama = false;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };

      urgency_low = {
        #background = "#3a3a3a";
        #foreground = "#f5f5f5";
        timeout = 2;
      };

      urgency_normal = {
        #background = "#3a3a3a";
        #foreground = "#f5f5f5";
        timeout = 2;
      };

      urgency_critical = {
        #background = "#3a3a3a";
        #foreground = "#f5f5f5";
        timeout = 2;
      };
    };
  };
}
