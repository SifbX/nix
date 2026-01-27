inputs: let
  darwinModules = import ../../modules/darwin inputs;
  homeManagerModules = import ../../modules/home_manager inputs;
  aliasScript = import ./scripts/alias_script.nix;

  mkDarwinConfig = username: profile:
    inputs.nix-darwin.lib.darwinSystem {
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
      system.stateVersion = 6;
      modules = [
        darwinModules.darwin
        homeManagerModules.profiles.${profile}
        (aliasScript username)
      ];
    };

  in {
    MacbookProFull = mkDarwinConfig "mozsoy" "full";
    MacbookProStandard = mkDarwinConfig "mozsoy" "standard";
    MacbookProMinimal = mkDarwinConfig "mozsoy" "minimal";
  }

