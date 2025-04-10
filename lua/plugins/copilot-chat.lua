return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary", -- use latest features
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- required
		{ "nvim-lua/plenary.nvim" }, -- required
	},
	cmd = { "CopilotChat", "CopilotChatToggle" },
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat Toggle" },
		{ "<leader>cq", "<cmd>CopilotChat<cr>", desc = "Copilot Chat Prompt" },
	},
	opts = {
		-- optional: customize prompt, layout, etc.
		show_help = "yes",
		debug = false,
	},
}
