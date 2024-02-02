{ userSettings, ... }:

{
  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [ clinfo glxinfo lshw vulkan-tools ];
    };
  };
}
