inputs: {
  mkDarwin = username: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = 5;
    nixpkgs.hostPlatform = "aarch64-darwin";
    users.users.${username} = {
      home = "/Users/${username}";
      name = username;
    };
  };
}
