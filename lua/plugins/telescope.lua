return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					winblend = 10,
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
						"%.cache/",
						"dist/",
						"build/",
						"target/",
						"%.next/",
						"venv/",
						"__pycache__/",
						"%.egg%-info/",
					},
				},
			})
		end,
	},
}
