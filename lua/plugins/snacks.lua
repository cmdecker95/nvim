return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Enable showing hidden files,
		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
				},
			},
		},
	},
}
