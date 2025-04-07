-- leader mapping
vim.g.mapleader = ","
vim.g.maplocalleader = ","

--vim.opt.number = true -- show absolute line numbers
--vim.opt.relativenumber = false -- disable relative numbers

require("config.options")
require("config.lazy")
require("config.keymaps")
