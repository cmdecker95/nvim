-- AI lives in two places.
--
-- Tab autocomplete is Copilot, and comes entirely from the ai.copilot LazyVim
-- extra (see lazyvim.json) -- nothing to configure here. vim.g.ai_cmp = false in
-- options.lua is what makes it inline ghost text accepted with <Tab>, rather
-- than one more source in the blink.cmp menu.
--
-- Agent sessions are claudecode.nvim, which speaks the same websocket protocol
-- the Claude Code CLI uses for its VS Code / JetBrains extensions: selections
-- and buffers go to the agent, and its edits come back as real diffs you accept
-- or reject. floating-claude.nvim supplies the terminal provider, so the session
-- is a centered float that collapses into a corner notification while a diff is
-- up and returns once Claude goes idle.

return {
	{
		"coder/claudecode.nvim",
		dependencies = {
			"folke/snacks.nvim",
			"hebercosfer/floating-claude.nvim",
		},
		-- Listing the commands gives lazy.nvim stubs to create, so :ClaudeCode*
		-- works without pressing a mapping first.
		cmd = {
			"ClaudeCode",
			"ClaudeCodeFocus",
			"ClaudeCodeSelectModel",
			"ClaudeCodeAdd",
			"ClaudeCodeSend",
			"ClaudeCodeTreeAdd",
			"ClaudeCodeStatus",
			"ClaudeCodeStart",
			"ClaudeCodeStop",
			"ClaudeCodeOpen",
			"ClaudeCodeClose",
			"ClaudeCodeDiffAccept",
			"ClaudeCodeDiffDeny",
			"ClaudeCodeCloseAllDiffs",
		},
		keys = {
			{ "<leader>a", "", desc = "+ai", mode = { "n", "x" } },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
			},
			-- Diffs: these mirror :w / :q inside the diff buffer.
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
			-- Park the float as a corner notification, or bring it back.
			{
				"<leader>an",
				function()
					require("floating-claude").toggle_mini()
				end,
				desc = "Minimize/restore Claude float",
			},
		},
		-- A function, not a table: require() has to run when the plugin loads,
		-- not while lazy.nvim is still parsing specs at startup.
		opts = function()
			return {
				terminal = {
					provider = require("floating-claude").provider,
				},
				-- The float would otherwise sit on top of the diff.
				diff_opts = {
					open_in_new_tab = true,
					hide_terminal_in_new_tab = true,
				},
			}
		end,
	},
}
