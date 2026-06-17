local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- LazyVim first, then extras (from lazyvim.json), then our overlay
		{ "LazyVim/LazyVim", import = "lazyvim.plugins", version = "*" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		-- latest git commit for plugins that don't pin a version
		version = false,
	},
	install = { colorscheme = { "kanagawa-dragon", "tokyonight", "habamax" } },
	checker = {
		enabled = true, -- poll GitHub for plugin / LazyVim updates
		notify = true, -- surface them so :Lazy update is a choice, not a surprise
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
