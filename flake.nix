{
  inputs = {
    flake3.url = "github:ehllie/flake3";
  };
  outputs = { flake3, ... }: {
    packages.aarch64-darwin.default = flake3.packages.aarch64-darwin.hello2;
  };
}
