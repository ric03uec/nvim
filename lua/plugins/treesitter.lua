return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- list of parsers to install
				ensure_installed = { "go", "lua", "bash", "markdown", "vim", "json", "yaml", "dockerfile" },

				-- install languages synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- auto install missing parsers when entering buffer
				auto_install = true,

				-- list of parsers to ignore installing (or use "all")
				ignore_install = { "toml" },

				modules = {},

				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					additional_vim_regex_highlighting = false,
				},

				indent = {
					enable = true,
				},

				-- Add any other modules here if needed, e.g., incremental_selection, textobjects
			})
		end,
	},
}
