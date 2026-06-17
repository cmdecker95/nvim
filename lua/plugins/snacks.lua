local M = {
	-- Toggle default file visibility in picker and explorer
	show_hidden = true, -- show dotfiles (e.g. .env, .gitignore)
	show_ignored = false, -- also show .gitignore'd files (e.g. node_modules)
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			sources = {
				explorer = {
					hidden = M.show_hidden,
					ignored = M.show_ignored,
				},
				files = {
					hidden = M.show_hidden,
					ignored = M.show_ignored,
				},
			},
		},
	},
}
