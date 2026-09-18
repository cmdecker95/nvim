-- Options are automatically loaded before lazy.nvim startup.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Telescope as the LazyVim picker (auto-enables extras.editor.telescope).
vim.g.lazyvim_picker = "telescope"

-- No Copilot / Codeium / ghost-text completion.
vim.g.ai_cmp = false
