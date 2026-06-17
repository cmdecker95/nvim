-- Keymaps are automatically loaded from this file on the VeryLazy event.
-- LazyVim provides defaults in lazyvim.config.keymaps; add your own below.

local map = vim.keymap.set

-- Keep cursor centered on half-page jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Paste over a visual selection without clobbering the yank register
map("x", "p", [["_dP]], { desc = "Paste without yanking selection" })
