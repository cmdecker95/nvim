local servers = {
	"lua_ls",
	"vimls",
	"vtsls",
	"eslint",
	"html",
	"cssls",
	"tailwindcss",
	"jsonls",
	"yamlls",
	"taplo",
	"dockerls",
	"docker_compose_language_service",
	"helm_ls",
	"basedpyright",
	"ruff",
	"gopls",
	"bashls",
	"terraformls",
}

return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			sources = { default = { "lsp", "path" } },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				cmd = "Mason",
				keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
				opts = {},
			},
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemaStore = { enable = false, url = "" },
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})

			vim.lsp.config("ruff", {
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
				end,
			})

			vim.lsp.config("gopls", {
				settings = {
					gopls = { gofumpt = true },
				},
			})

			require("mason-lspconfig").setup({
				automatic_enable = servers,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
						buffer = event.buf,
						desc = "Goto definition",
					})
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = vim.list_extend(vim.deepcopy(servers), {
				"prettier",
				"stylua",
				"shfmt",
				"shellcheck",
			}),
		},
	},
}
