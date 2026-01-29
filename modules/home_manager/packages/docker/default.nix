{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.docker or false) {
    home.packages = [ pkgs.docker ];
  };
}
