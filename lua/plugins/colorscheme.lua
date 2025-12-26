return {
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
