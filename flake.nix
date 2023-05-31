{
  inputs = {
    flake3.url = "github:ehllie/flake3";
  };
  outputs = { flake3, ... }:
    let
      eachSystem = pkgBuild:
        builtins.listToAttrs (builtins.map
          (system: { name = system; value = pkgBuild system; })
          [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ]);
    in
    {
      packages = eachSystem (system: {
        default = flake3.packages.${system}.hello2;
      });
    };
}
