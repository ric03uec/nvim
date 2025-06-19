return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			-- show python venv only if VIRTUAL_ENV is set AND current file is Python
			local function python_venv()
				if vim.bo.filetype ~= "python" then
					return ""
				end
				local venv = os.getenv("VIRTUAL_ENV")
				if venv and venv ~= "" then
					return " " .. vim.fn.fnamemodify(venv, ":t")
				end
				return ""
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					icons_enabled = true,
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = { 
						{
							"filename",
							path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
							file_status = true,
						}, 
						python_venv 
					}, -- <-- venv here
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
