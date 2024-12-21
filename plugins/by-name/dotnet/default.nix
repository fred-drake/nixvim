{ lib, ... }:
lib.nixvim.neovim-plugin.mkNeovimPlugin {
  name = "dotnet";
  packPathName = "dotnet.nvim";
  package = "dotnet-nvim";

  maintainers = [ lib.maintainers.khaneliman ];

  settingsOptions = {
    bootstrap = {
      auto_bootstrap = lib.nixvim.defaultNullOpts.mkBool true ''
        Automatically call "bootstrap" when creating a new file, adding a namespace and a class to the files.
      '';
    };

    project_selection = {
      path_display = lib.nixvim.defaultNullOpts.mkStr "filename_first" ''
        Determines how file paths are displayed. All of Telescope's path_display options are supported.
      '';
    };
  };

  settingsExample = {
    bootstrap = {
      auto_bootstrap = false;
    };
    project_selection = {
      path_display = "truncate";
    };
  };
}
