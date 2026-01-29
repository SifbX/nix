{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.colima or false) {
    home.packages = [ pkgs.colima ];
  };
}
