local M = {
	inlay_hints = false, -- show inline type/param hints from the LSP
	lua_globals = { "vim" }, -- globals lua_ls should treat as defined
}

return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = {
			enabled = M.inlay_hints,
		},
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = M.lua_globals,
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			},
		},
	},
}
