{
    description ="Flow backend flake for development";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit system; };
        in {
            devShells.default = pkgs.mkShell {
                buildInputs = with pkgs; [
                    nodejs
                    yarn
                    git
                    openjdk21
                    docker-compose

                ];
                shellHook = ''
                    echo "Welcome to the Flow backend development shell!"
                    echo "Make sure you have Docker running."
                    echo "You can start the development environment with 'docker-compose up --build'."
                    echo "Happy coding!"
                '';
            };
        }
    );
}