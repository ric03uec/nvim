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
					numbers = "ordinal", -- show tab numbers for IDE-like navigation
					close_command = "Bdelete! %d", -- use Bdelete for better buffer management
				right_mouse_command = "Bdelete! %d", -- right click to close
				left_mouse_command = "buffer %d", -- left click to switch
					show_buffer_close_icons = true,
					show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- maintain buffer order
				always_show_bufferline = true, -- always show even with single buffer
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
