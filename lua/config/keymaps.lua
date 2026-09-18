local map = vim.keymap.set
local buffers = require("config.buffers")

-- Keep cursor centered on half-page jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Paste over a visual selection without clobbering the yank register
map("x", "p", [["_dP]], { desc = "Paste without yanking selection" })

-- Windows (LazyVim-style; default is <C-w>h/j/k/l and <C-w>s/v)
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
map("n", "<leader>-", "<C-w>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-w>v", { desc = "Split window right", remap = true })
map("n", "<leader>w-", "<C-w>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-w>v", { desc = "Split window right", remap = true })
map("n", "<leader>wd", "<C-w>c", { desc = "Delete window", remap = true })
map("n", "<leader>wo", "<C-w>o", { desc = "Delete other windows", remap = true })
map("n", "<leader>ww", "<C-w>p", { desc = "Other window", remap = true })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

-- Buffers (H/L also cycle via bufferline)
map("n", "<leader>bd", buffers.delete, { desc = "Delete buffer" })
map("n", "<leader>bo", buffers.delete_other, { desc = "Delete other buffers" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to other buffer" })
map("n", "<leader>bD", "<cmd>bd<cr>", { desc = "Delete buffer and window" })

-- Save n' quit
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

map("n", "<leader>gg", function()
	if vim.fn.executable("lazygit") == 0 then
		vim.notify("lazygit not found", vim.log.levels.ERROR)
		return
	end

	local root = vim.fs.root(0, ".git") or vim.uv.cwd()
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.max(math.floor(vim.o.columns * 0.9), 40)
	local height = math.max(math.floor(vim.o.lines * 0.9), 10)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2) - 1,
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	})

	vim.fn.jobstart({ "lazygit" }, {
		term = true,
		cwd = root,
		on_exit = function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
			if vim.api.nvim_buf_is_valid(buf) then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end,
	})
	vim.cmd("startinsert")
end, { desc = "Lazygit" })
