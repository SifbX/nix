{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.spotify or false) {
    home.packages = [ pkgs.spotify ];
  };
}
