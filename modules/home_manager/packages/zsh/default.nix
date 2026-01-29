{ pkgs, lib, enabledApps ? {}, ... }:
{
  config = lib.mkIf (enabledApps.zsh or false) {
    programs.zsh.enable = true;
  };
}
