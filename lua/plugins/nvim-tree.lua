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
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", ".", function()
				local node = api.tree.get_node_under_cursor()
				if node and node.nodes then
					api.tree.change_root_to_node(node)
				end
			end, opts("CD"))

			vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
		end,
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
