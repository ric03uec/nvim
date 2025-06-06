-- Set the leader key for keymaps
-- This key is used as a prefix for custom key mappings
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Enable automatic indentation for code formatting
vim.opt.autoindent = true

-- Display a vertical line at column 80 as a visual guide for code width
vim.opt.colorcolumn = "80"

-- Override vim.notify before plugins load
vim.notify = function(msg, level, opts)
  -- Use print with level prefix instead of popup notifications
  local level_name = level and vim.log.levels[level] or "INFO"
  print(string.format("[%s] %s", level_name, msg))
end

-- Load configuration modules
require("config.options")  -- General Neovim settings and options
require("config.keymaps")  -- Custom keyboard mappings and shortcuts
require("config.lazy")     -- Plugin manager initialization and setup
