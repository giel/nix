{ ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [ clinfo glxinfo lshw vulkan-tools ];
    };
  };
}
