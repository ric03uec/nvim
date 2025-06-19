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
						-- Don't ignore build directory
						"target/",
						"%.next/",
						"venv/",
						"__pycache__/",
						"%.egg%-info/",
					},
					-- Respect gitignore but ensure we can find .env files
					respect_gitignore = true,
				},
			})
		end,
	},
}
