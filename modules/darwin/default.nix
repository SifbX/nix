inputs: let
  mkDarwin = username: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    programs.zsh.enable = true;
    system.stateVersion = 5;
    nixpkgs.hostPlatform = "aarch64-darwin";
    users.users.${username} = {
      home = "/Users/${username}";
      name = username;
    };
  };
in
{
  darwin = mkDarwin "mozsoy";
}
