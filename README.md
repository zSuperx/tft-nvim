# tft-nvim (true/false toggle)

This plugin just extends `<C-a>` and `<C-x>` functionality to toggle `True` and
`False`. Nothing else. No custom word swap mappings. No customizability. I
ain't that good with Lua.

I don't use normie plugin managers, so it's up to you on how to set this bad
boy up.

...*Buuuuut* if you're clinically insane like me and use NVF to manage your
Neovim with Nix, then you can add this plugin to your build as follows:

```nix
# flake.nix
{
  inputs = {
    tft-nvim = {
      url = "github:zSuperx/tft-nvim";
      flake = false;
    };
  };
}
```

```nix
# wherever you configure nvf
{ inputs, pkgs, ... }:
{
  config.vim = {
    extraPlugins = {
      "tft-nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "tft-nvim";
          src = inputs.tft-nvim;
        };
        setup = ''
          require("tft-nvim").setup()
        '';
      };
    };
  };
}
```
