{
  lib,
  helpers,
  ...
}:
with lib;
lib.nixvim.neovim-plugin.mkNeovimPlugin {
  name = "hydra";
  packPathName = "hydra.nvim";
  package = "hydra-nvim";

  maintainers = [ maintainers.GaetanLepage ];

  extraOptions = {
    # A list of `Hydra` definitions
    hydras = import ./hydras-option.nix { inherit lib helpers; };
  };

  settingsOptions = import ./settings-options.nix { inherit lib helpers; };

  settingsExample = {
    exit = false;
    foreign_keys = "run";
    color = "red";
    buffer = true;
    invoke_on_body = false;
    desc = null;
    on_enter = ''
      function()
        print('hello')
      end
    '';
    timeout = 5000;
    hint = false;
  };

  callSetup = false;
  extraConfig = cfg: {
    plugins.hydra.luaConfig.content = ''
      hydra = require('hydra')

      hydra.setup(${lib.nixvim.toLuaObject cfg.settings})

      __hydra_defs = ${lib.nixvim.toLuaObject cfg.hydras}
      for _, hydra_config in ipairs(__hydra_defs) do
        hydra(hydra_config)
      end
    '';
  };
}
