return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File explorer" },
	},
	opts = {
		hijack_directories = { enable = false },
		filters = {
			custom = { "^\\.git$" },
		},
		renderer = {
			highlight_git = "all",
			icons = {
				git_placement = "right_align",
				glyphs = {
					git = {
						unstaged = "M",
						staged = "S",
						unmerged = "C",
						renamed = "R",
						untracked = "U",
						deleted = "D",
						ignored = "I",
					},
				},
			},
		},
		actions = {
			open_file = {
				window_picker = { enable = false },
			},
		},
	},
}
