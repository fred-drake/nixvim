{ lib, ... }:
lib.nixvim.neovim-plugin.mkNeovimPlugin {
  name = "dracula-nvim";
  packPathName = "dracula.nvim ";
  moduleName = "dracula";
  colorscheme = "dracula";
  isColorscheme = true;

  maintainers = [ lib.maintainers.refaelsh ];

  settingsExample = {
    italic_comment = true;
    colors.green = "#00FF00";
  };
}
