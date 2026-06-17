return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = false },
		servers = {
			bashls = {},
			vimls = {},
			html = {},
			cssls = {},
			yamlls = {
				-- LazyVim's yaml extra merges the full SchemaStore catalog here.
				-- Replace that hook so playbook.yml is not checked as Ansible.
				before_init = function(_, new_config)
					new_config.settings.yaml.schemas = vim.tbl_deep_extend(
						"force",
						new_config.settings.yaml.schemas or {},
						require("schemastore").yaml.schemas({
							ignore = { "Ansible Playbook" },
						})
					)
				end,
			},
		},
	},
}
