-- Initialize and setup lazy.nvim
require("config.lazy")

-- Set default colorscheme
vim.cmd.colorscheme("kanagawa-dragon")

-- Disable inlay hints
vim.lsp.inlay_hint.enable(false)
