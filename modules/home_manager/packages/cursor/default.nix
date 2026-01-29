{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.cursor or false) {
    home.packages = [ pkgs.code-cursor ];
  };
}
