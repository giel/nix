{ ... }:

{
  services = {
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        scrollMethod = "twofinger";
        naturalScrolling = true; # The correct way of scrolling
        accelProfile = "adaptive"; # Speed settings
        #accelSpeed = "-0.5";
        disableWhileTyping = true;
      };
    };
    # Enable the X11 windowing system.
    xserver = {
      # Configure keymap in X11
      xkb = {
        layout = "us";
        # see also desktop/gnome for similair settings that are needed for gnome
        variant = "euro";
        options = "caps:escape";
      };

    };

  };

}
