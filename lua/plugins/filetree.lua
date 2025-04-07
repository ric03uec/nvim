return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
					side = "left",
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})

			-- define mapping inside config block
			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
