local colorscheme = "kanagawa-dragon"

return {
	{ "LazyVim/LazyVim", opts = { colorscheme = colorscheme } },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
}
