# Neovim

My personal Neovim config, built on [LazyVim](https://www.lazyvim.org/).

## Structure

```
init.lua                 -- bootstraps require("config.lazy")
lua/
  config/
    lazy.lua             -- lazy.nvim + LazyVim bootstrap
    options.lua          -- editor options (loaded before startup)
    keymaps.lua          -- custom keymaps (loaded on VeryLazy)
    autocmds.lua         -- custom autocmds (loaded on VeryLazy)
  plugins/               -- one file per plugin / plugin group
    colorscheme.lua
    harpoon.lua
    lsp.lua
    navigator.lua
    snacks.lua
```

`lua/config/{options,keymaps,autocmds}.lua` are loaded automatically by LazyVim, and everything under `lua/plugins/` is auto-imported as plugin specs.

## Customizing

Each config file starts with a `local M = { ... }` of flags set to their current defaults, so you can retune behavior in one place.
