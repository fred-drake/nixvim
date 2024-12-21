{
  lib,
  ...
}:
lib.nixvim.vim-plugin.mkVimPlugin {
  name = "nabla";
  packPathName = "nabla.nvim";
  package = "nabla-nvim";

  description = ''
    You can bind the popup action like so:
    ```nix
      keymaps = [
        {
          key = "<leader>p";
          action.__raw = "require('nabla').popup";
        }
      ];
    ```

    You can also wrap an explicit call to `popup` in a `function() ... end` in order to provide
    a `border` option.

    See [README](https://github.com/jbyuki/nabla.nvim/?tab=readme-ov-file#configuration) for more
    information.
  '';

  maintainers = [ lib.maintainers.GaetanLepage ];
}
