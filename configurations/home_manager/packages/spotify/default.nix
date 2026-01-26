{ pkgs, lib, ... }: {
  programs.spotify = {
    enable = lib.mkDefault true;
  };
  home.packages = [ pkgs.spotify-player ];
}