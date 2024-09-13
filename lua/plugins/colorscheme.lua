return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup()

			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "folke/tokyonight.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim" },
	{ "craftzdog/solarized-osaka.nvim" },
	{ "ayu-theme/ayu-vim" },
}
