{ ... }:

{
  services = {
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "us";
        # see also desktop/gnome for similair settings that are needed for gnome
        variant = "euro";
        options = "caps:escape";
      };
      libinput = { enable = true; };
    };

  };

}
