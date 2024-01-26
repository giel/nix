{ ... }:

{

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the budgie Desktop Environment.
      desktopManager.budgie = { enable = true; };
    };
  };

  # Enable dconf for programs that might need it
  programs.dconf.enable = true;

}
