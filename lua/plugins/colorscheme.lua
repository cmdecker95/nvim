local colorscheme = "kanagawa-dragon"

return {
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme(colorscheme)
		end,
	},
}
