# tft-nvim (true/false toggle)

This plugin just swaps `true` and `false`. Nothing else. No fancy custom word
swap mappings. No customizability. Just pure, slopless function over form.

## Usage

The function `:ToggleTF` is exposed and can be invoked to manually swap the
potential boolean under the cursor. However, hitting `<C-a>` or `<C-x>` will
call this automatically :P

Casing will be recognized and preserved for the following:

- `true <-> false`
- `True <-> False`
- `TRUE <-> FALSE`


## Installing

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
