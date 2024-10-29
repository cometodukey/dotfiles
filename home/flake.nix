{
    description = "NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/master";
        nixpkgs-latest.url = "github:NixOS/nixpkgs/master";
        # nixpkgs-pin1.url = "github:NixOS/nixpkgs?rev=c2e7745b08a303b468fcaced4bf0774900aba9bc";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs: {
        homeConfigurations = {
            homeserver = inputs.home-manager.lib.homeManagerConfiguration rec {
                pkgs = import inputs.nixpkgs { localSystem = "x86_64-linux"; };
                extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
                modules = [
                    {
                        home = {
                            homeDirectory = "/home/duke";
                            username = "duke";
                            stateVersion = "24.05";
                        };
                    }
                    ./config/home.nix
                ];
            };

            thinkpad = inputs.home-manager.lib.homeManagerConfiguration rec {
                pkgs = import inputs.nixpkgs { localSystem = "x86_64-linux"; };
                extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
                modules = [
                    {
                        home = {
                            homeDirectory = "/home/duke";
                            username = "duke";
                            stateVersion = "24.05";
                        };
                    }
                    ./config/desktop.nix
                    ./config/home.nix
                ];
            };
        };
    };
}
