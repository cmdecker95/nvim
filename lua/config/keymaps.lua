-- Keymaps are automatically loaded from this file on the VeryLazy event.
-- LazyVim provides defaults in lazyvim.config.keymaps; add your own below.

local map = vim.keymap.set

-- Save with <leader>w
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
