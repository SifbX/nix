{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.htop or false) {
    home.packages = [ pkgs.htop ];
  };
}
