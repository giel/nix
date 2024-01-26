{ ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the i3 window manager via xfce Desktop Environment.

      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      # displayManager.defaultSession = "xfce";
      windowManager.i3.enable = true;
    };
  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}
