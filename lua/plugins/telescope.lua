-- Extend the LazyVim Telescope extra. <leader><space> stays "files in root";
-- <leader>ff includes gitignored files (still hides .git).

return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ no_ignore = true, hidden = true })
			end,
			desc = "Find Files (all)",
		},
	},
}
