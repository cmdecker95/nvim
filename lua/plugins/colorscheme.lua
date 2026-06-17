local M = {
	-- Colorscheme on startup (must be installed below)
	colorscheme = "kanagawa-dragon",
}

return {
	-- Tell LazyVim which colorscheme to load.
	{ "LazyVim/LazyVim", opts = { colorscheme = M.colorscheme } },

	-- Installed themes to pick from (set M.colorscheme above to switch).
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup()
		end,
	},
	{ "folke/tokyonight.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim" },
	{ "sainnhe/sonokai" },
	{ "sainnhe/everforest" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/edge" },
	{ "rebelot/kanagawa.nvim" },
}
