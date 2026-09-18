# Neovim

Personal config on [LazyVim](https://www.lazyvim.org/). Overlay only lives in `lua/plugins/` and `lua/config/`.

## Structure

```
init.lua                 -- require("config.lazy")
lazyvim.json             -- extras (Telescope, Harpoon2, languages, prettier)
lua/
  config/
    lazy.lua             -- lazy.nvim + LazyVim import (version = "*")
    options.lua          -- picker = telescope, no AI cmp
    keymaps.lua          -- extra maps on top of LazyVim
    autocmds.lua         -- extra autocmds on top of LazyVim
  plugins/               -- overrides / extra plugins
    colorscheme.lua
    explorer.lua         -- nvim-tree in place of snacks explorer
    telescope.lua        -- <leader>ff = all files
    lsp.lua              -- extra servers, inlay hints off
    tmux.lua
```

## Updates

LazyVim is pinned to the latest **stable tag** (`version = "*"`). The checker notifies when plugins or LazyVim are behind.

- `:Lazy` — plugin UI
- `:Lazy update` — apply updates (writes `lazy-lock.json`)
- `:LazyExtras` — toggle extras
- `<leader>L` — LazyVim changelog

## Customizing

Keep overlay files small. Prefer extras over copying LazyVim plugin specs. `lua/config/{options,keymaps,autocmds}.lua` load after LazyVim's defaults.
