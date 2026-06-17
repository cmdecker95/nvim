return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Go to left window/pane" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Go to lower window/pane" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Go to upper window/pane" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Go to right window/pane" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Go to previous window/pane" },
	},
}
