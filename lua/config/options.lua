-- Options are automatically loaded from this file before lazy.nvim startup.
-- LazyVim sets sensible defaults in lazyvim.config.options.
-- Anything here runs after and overrides them.

local opt = vim.opt

opt.number = true -- show absolute line numbers
opt.relativenumber = true -- show relative line numbers (great with motions)
opt.scrolloff = 4 -- keep N lines visible above/below the cursor
opt.wrap = false -- don't soft-wrap long lines
opt.signcolumn = "yes" -- always show the sign column (no text shifting)
opt.cursorline = true -- highlight the current line
opt.termguicolors = true -- enable 24-bit colors
opt.ignorecase = true -- case-insensitive search...
opt.smartcase = true -- ...unless the query contains capitals
