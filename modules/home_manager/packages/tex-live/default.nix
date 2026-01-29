{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.texlive or false) {
    home.packages = [ pkgs.texliveFull ];
  };
}
