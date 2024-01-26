{ ... }:

{
  services = {
    # Enable the X11 windowing system.
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Enable the budgie Desktop Environment.
      # displayManager.gdm.enable = true;
      # desktopManager.budgie = { enable = true; };

      # Enable the KDE Plasma Desktop Environment.
      # displayManager.sddm.enable = true;
      # desktopManager.plasma5 = { enable = true; };

      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      # i3 not integrated yet 
    };
  };

}
