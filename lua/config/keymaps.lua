local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map 'jk' to escape insert mode
map("i", "jk", "<Esc>l", opts)

-- Common movement
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
--map("n", "<leader>x", ":bdelete<CR>", opts)
map("n", "<leader>x", ":Bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
-- Move between splits
--map("n", "<C-h>", "<C-w>h", opts)
--map("n", "<C-j>", "<C-w>j", opts)
--map("n", "<C-k>", "<C-w>k", opts)
--map("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Telescope file finder (like ctrlp)
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)

-- TODO: make the set function format the same as function up top

-- Save current buffer
map("n", "<leader>w", "<cmd>w<CR>", opts)

-- Quit current tab
map("n", "<leader>q", "<cmd>tabclose<CR>", { noremap = true, silent = true })

map("n", "<leader><Space>", function()
	require("which-key").show("<leader>")
end, { noremap = true, silent = true })

map("n", "q", function()
	if #vim.api.nvim_list_tabpages() > 1 then
		vim.cmd("tabclose")
	else
		vim.notify("Only one tab open — not closing it!", vim.log.levels.INFO)
	end
end, { noremap = true, silent = true })

-- Set keymap here to ensure it’s defined after plugin loads
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
