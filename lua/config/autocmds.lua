-- Autocmds are automatically loaded on the VeryLazy event.
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Disable auto-comment continuation
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.filetype.add({
	extension = { jsonl = "json" },
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
	pattern = {
		[".*/templates/.*%.ya?ml"] = "helm",
		[".*/templates/.*%.tpl"] = "helm",
		["helmfile.*%.ya?ml"] = "helm",
	},
})
