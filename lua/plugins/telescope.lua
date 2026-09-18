return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ no_ignore = true })
			end,
			desc = "Find all files",
		},
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{
			"<leader>uC",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "Colorschemes",
		},
	},
	opts = {
		pickers = {
			find_files = {
				hidden = true,
				find_command = { "fd", "--type", "f", "--exclude", ".git" },
			},
			live_grep = {
				additional_args = { "--hidden", "--glob", "!.git/**" },
			},
		},
	},
}
