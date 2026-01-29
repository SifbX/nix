{ lib, enabledApps, ... }:
let
  # Base apps that are always in the dock
  baseApps = [
    { app = "/Applications/Safari.app"; }
  ];

  # Conditional apps based on enabled packages (Nix apps are in /Applications/Nix Apps/)
  optionalApps = lib.optionals (enabledApps.spotify or false) [
    { app = "/Applications/Nix Apps/Spotify.app"; }
  ];
in
{
  config.system.defaults.dock.persistent-apps = baseApps ++ optionalApps;
}
