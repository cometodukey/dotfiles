{
    description = "Multi-host NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations = {
            "homeserver" = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./hosts/homeserver.nix ];
            };
            "thinkpad" = nixpkgs.lib.nixosSystem {
                system = "x86_64-system";
                modules = [ ./hosts/thinkpad.nix ];
            };
        };
    };
}
