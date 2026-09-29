-- Options are automatically loaded before lazy.nvim startup.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Telescope as the LazyVim picker (auto-enables extras.editor.telescope).
vim.g.lazyvim_picker = "telescope"

-- Auto-completion
vim.g.ai_cmp = true

-- Never conceal anything. LazyVim sets this to 2, which hands treesitter
-- permission to hide the characters it has tagged as markup -- in markdown that
-- means ``` fences, *emphasis* markers and [](link) syntax vanish. 0 is
-- Neovim's own default and renders every buffer literally.
-- <leader>uc toggles concealing back on for the current buffer if you want it.
vim.opt.conceallevel = 0
