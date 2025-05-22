-- config/options.lua

-- Disable relative number globally
vim.opt.number = true
vim.opt.relativenumber = false

-- Indentation
vim.opt.autoindent = true -- set autoindent
vim.opt.smarttab = true -- set smarttab

-- Completion behavior
vim.opt.complete:remove("i") -- set complete-=i

-- Matching brackets
vim.opt.showmatch = true -- set showmatch

-- Tabs and spaces
vim.opt.expandtab = true -- set expandtab
vim.opt.tabstop = 2 -- set tabstop=2
vim.opt.softtabstop = 2 -- set softtabstop=2
vim.opt.shiftwidth = 2 -- set shiftwidth=2
vim.opt.shiftround = true -- set shiftround

-- Number format handling
vim.opt.nrformats:remove("octal") -- set nrformats-=octal

-- Disable LazyVim's automatic number toggle on mode switch
-- vim.g.lazyvim_autoformat = false

-- defer clearing LazyVim's relative number toggle until it's created
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- Try to clear the group only if it exists
		pcall(function()
			vim.api.nvim_clear_autocmds({ group = "lazyvim_auto_number" })
		end)
		-- Force relative number off again just in case
		vim.opt.relativenumber = false
	end,
})
