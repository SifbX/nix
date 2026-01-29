{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.uv or false) {
    home.packages = [ pkgs.uv ];
  };
}
