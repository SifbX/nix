userName: { pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.zsh.enable = true;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.${userName} = {
    home = "/Users/${userName}";
    name = userName;
  };
}