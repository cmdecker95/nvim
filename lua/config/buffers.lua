local M = {}

function M.delete(bufnr)
	bufnr = type(bufnr) == "number" and bufnr or vim.api.nvim_get_current_buf()
	if not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end

	local listed = vim.tbl_filter(function(b)
		return b ~= bufnr and vim.bo[b].buflisted and vim.api.nvim_buf_is_valid(b)
	end, vim.api.nvim_list_bufs())

	for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
		if #listed > 0 then
			vim.api.nvim_win_set_buf(win, listed[#listed])
		else
			vim.api.nvim_win_set_buf(win, vim.api.nvim_create_buf(true, false))
		end
	end

	pcall(vim.api.nvim_buf_delete, bufnr, { force = false })
end

function M.delete_other()
	local current = vim.api.nvim_get_current_buf()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if b ~= current and vim.bo[b].buflisted then
			M.delete(b)
		end
	end
end

return M
