{ ... }:

{
  # My Nvidia card is the NVIDIA GeForce GTX 1050 Ti Mobile
  # All of my attempts so far failed to get this working.
  # See all of that commented out.

  # Enable OpenGL
  # hardware.opengl = {
  #   enable = true;
  #   driSupport = true;
  #   driSupport32Bit = true;
  # };

  # Load nvidia driver for Xorg and Wayland
  # services.xserver.videoDrivers = [ "nvidia" ];

  #   hardware.nvidia = {
  # 
  #     # Modesetting is required.
  #     modesetting.enable = true;
  # 
  #     # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
  #     powerManagement.enable = false;
  #     # Fine-grained power management. Turns off GPU when not in use.
  #     # Experimental and only works on modern Nvidia GPUs (Turing or newer).
  #     powerManagement.finegrained = false;
  # 
  #     # Use the NVidia open source kernel module (not to be confused with the
  #     # independent third-party "nouveau" open source driver).
  #     # Support is limited to the Turing and later architectures. Full list of 
  #     # supported GPUs is at: 
  #     # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
  #     # Only available from driver 515.43.04+
  #     # Do not disable this unless your GPU is unsupported or if you have a good reason to.
  #     open = true;
  # 
  #     # Enable the Nvidia settings menu,
  #     # accessible via `nvidia-settings`.
  #     nvidiaSettings = true;
  # 
  #     # Optionally, you may need to select the appropriate driver version for your specific GPU.
  #     package = config.boot.kernelPackages.nvidiaPackages.stable;
  #   };
  # 
  #   hardware.nvidia.prime = {
  #     # Optimus PRIME Option A: Offload Mode
  #     # Offload Mode is available in NixOS 20.09 and higher, and requires 
  #     # an Nvidia card of the Turing generation or newer, 
  #     # and an Intel chipset from the Coffee Lake generation or newer. 
  #     # Not choosen: https://nixos.wiki/wiki/nvidia
  # 
  #     # Optimus PRIME Option B: Sync Mode
  #     # introduces better performance and greatly reduces screen tearing, 
  #     # at the expense of higher power consumption. 
  #     sync.enable = true;
  # 
  #     # Make sure to use the correct Bus ID values for your system!
  #     intelBusId = "PCI:0:2:0";
  #     nvidiaBusId = "PCI:1:0:0";
  #   };
  # 
}
