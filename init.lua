-- Set the leader key for keymaps
-- This key is used as a prefix for custom key mappings
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Enable automatic indentation for code formatting
vim.opt.autoindent = true

-- Display a vertical line at column 80 as a visual guide for code width
vim.opt.colorcolumn = "80"

-- Load configuration modules
require("config.options")  -- General Neovim settings and options
require("config.keymaps")  -- Custom keyboard mappings and shortcuts
require("config.lazy")     -- Plugin manager initialization and setup
