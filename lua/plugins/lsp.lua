return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "pyright" },
				automatic_installation = true,
			})

			-- Safely load cmp_nvim_lsp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_lsp.default_capabilities()
			end

			-- Set up Go
			require("lspconfig").gopls.setup({
				capabilities = capabilities,
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

			-- Configure pyright
			require("lspconfig").pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						python = {
							pythonPath = "./.venv/bin/python",
						},
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace", -- or "openFilesOnly"
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
		end,
	},
}
