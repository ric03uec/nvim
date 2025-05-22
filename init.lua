-- leader mapping
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.autoindent = true

vim.opt.colorcolumn = "80"

require("config.options")
require("config.keymaps")
require("config.lazy")
