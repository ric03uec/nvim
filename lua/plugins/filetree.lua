return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Custom keymaps
				vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
				vim.keymap.set("n", "o", api.node.open.tab, opts("Open: New Tab"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open File"))
				vim.keymap.set("n", "<C-e>", api.tree.close, opts("Close Tree"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create File or Directory"))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach,
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
				actions = {
					open_file = {
						quit_on_open = false,
					},
				},
			})

			-- Leader shortcut to toggle the tree
			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
