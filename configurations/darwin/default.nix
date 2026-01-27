inputs: let
  username = "mozsoy";

  darwinModules = import ../../modules/darwin inputs;
  homeManagerModules = import ../../modules/home_manager inputs;
  aliasScript = import ./scripts/alias_script.nix username;


  mkDarwinConfig = username: profile:
    inputs.nix-darwin.lib.darwinSystem {
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
      system.stateVersion = 6;
      modules = [
        darwinModules.darwin
        aliasScript
        homeManagerModules.profiles.${profile}
      ];
    };

  in {
    MacbookProFull = mkDarwinConfig username "full";
    MacbookProStandard = mkDarwinConfig username "standard";
    MacbookProMinimal = mkDarwinConfig username "minimal";
  }

