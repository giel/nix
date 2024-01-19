{ ... }:

{
  home-manager = {
    users.giels = { pkgs, ... }: {
      home.packages = with pkgs; [
        bcompare
        dotnet-sdk
        jetbrains.rider
        meld
      ];
    };
  };
}
