local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map 'jk' to escape insert mode
map("i", "jk", "<Esc>", opts)

-- Common movement
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Move between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Telescope file finder (like ctrlp)
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
