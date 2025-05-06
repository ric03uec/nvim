return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- shows buffers (use "tabs" for tab pages)
					numbers = "none", -- or "ordinal" | "buffer_id" | function
					close_command = "bdelete! %d", -- buffer close behavior
					show_buffer_close_icons = true,
					show_close_icon = false,
					separator_style = "slant", -- "slant" | "padded_slant" | "thick" | "thin" | "slope" | "none"
					diagnostics = "nvim_lsp", -- shows LSP diagnostics
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})
		end,
	},
}
