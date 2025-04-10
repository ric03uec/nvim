-- ~/.config/nvim/lua/plugins/copilot.lua
return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot", -- Enables lazy loading on :Copilot command
	event = "InsertEnter", -- Lazy load on InsertEnter
	build = ":Copilot auth", -- Optional: Trigger auth after build
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-l>",
					next = "<C-]>",
					prev = "<C-[>",
					dismiss = "<C-/>",
				},
			},
			filetypes = {
				markdown = true,
				help = true,
				-- Disable for some filetypes if needed
				gitcommit = true,
			},
		})
	end,
}
