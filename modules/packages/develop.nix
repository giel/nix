{ userSettings, ... }:

{
  home-manager = {
    users.${userSettings.user} = { pkgs, ... }: {
      home.packages = with pkgs; [
        gh
        jq
        mediawriter
        meld
      ];
    };
  };
}
