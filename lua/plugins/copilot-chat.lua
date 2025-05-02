return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = { "CopilotChat", "CopilotChatToggle" },
	keys = {
		{ "<leader>ac", ":CopilotChat<cr>", desc = "Copilot Chat" },
		{ "<leader>,ac", "<cmd>CopilotChat<cr>", desc = "Copilot Chat (Alt)" },
		{ "<leader>ax", "<cmd>CopilotChat explain<cr>", mode = { "n", "v" }, desc = "Copilot Explain" },
		{ "<leader>ex", "<cmd>CopilotChatCustom explain<cr>", desc = "Explain in simple terms" },
		{ "<leader>op", "<cmd>CopilotChatCustom optimize<cr>", desc = "Optimize Code" },
		{ "<leader>ds", "<cmd>CopilotChatCustom docstring<cr>", desc = "Generate Docstring" },
	},
	opts = {
		prompts = {
			explain = {
				prompt = "Explain the following code in simple terms:",
			},
			optimize = {
				prompt = "Optimize this code for performance and readability:",
			},
			docstring = {
				prompt = "Generate a detailed Go docstring for the selected function:",
			},
			Yarrr = {
				system_prompt = "You are fascinated by pirates, so please respond in pirate speak.",
			},
		},
	},
}
