{
  self,
  config,
  lib,
  withSystem,
  ...
}:
{
  _module.args.helpers = import ../lib {
    inherit lib;
    flake = self;
  };

  # TODO: output lib without pkgs at the top-level
  flake.lib = lib.genAttrs config.systems (
    lib.flip withSystem (
      { pkgs, ... }:
      {
        # NOTE: this is the publicly documented flake output we've had for a while
        check = import ../lib/tests.nix { inherit self lib pkgs; };
        # TODO: no longer needs to be per-system
        helpers = import ../lib {
          inherit lib;
          flake = self;
        };
      }
    )
  );
}
