if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>uh", function()
		vim.lsp.inlay_hint(0, nil)
	end, { desc = "Toggle Inlay Hint" })
end
