local buffers = require("config.buffers")

return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
		{ "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
		{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
	},
	opts = {
		options = {
			close_command = buffers.delete,
			right_mouse_command = buffers.delete,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			offsets = {
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
