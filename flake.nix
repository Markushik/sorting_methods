{
  description = "Nim project with Nix";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-nimble.url = "github:nix-community/flake-nimble";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # Или используйте стабильную версию
  };
  
  outputs = { self, nixpkgs, flake-utils, flake-nimble }:
    flake-utils.lib.eachDefaultSystem (sys:
      let pkgs = nixpkgs.legacyPackages.${sys}; in
      rec {
        pkgsWithNimble = pkgs.appendOverlays [ flake-nimble.overlay ];
        
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgsWithNimble; [ nim nimlsp go-task ];
        };
      });
}

