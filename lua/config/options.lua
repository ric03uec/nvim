-- config/options.lua

-- Disable relative number globally
vim.opt.number = true
vim.opt.relativenumber = false

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
