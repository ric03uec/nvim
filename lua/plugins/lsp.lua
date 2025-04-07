return {
	-- LSP support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Set up mason
			require("mason").setup()

			-- Ensure gopls is installed
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls" },
			})

			-- Set up gopls via lspconfig
			require("lspconfig").gopls.setup({
				settings = {
					gopls = {
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
					},
				},
			})
		end,
	},
}
