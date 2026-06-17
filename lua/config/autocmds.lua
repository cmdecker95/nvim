-- Autocmds are automatically loaded from this file on the VeryLazy event.
-- LazyVim provides defaults in lazyvim.config.autocmds; add your own below.

-- Disable auto-comment continuation
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
