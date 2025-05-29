local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map 'jk' to escape insert mode
map("i", "jk", "<Esc>l", opts)

-- Common movement
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", "<cmd>Bdelete<CR>", { noremap = true, silent = true, desc = "Close current buffer tab" })
-- Close buffer tab (IDE-like)
map("n", "<C-w>", "<cmd>Bdelete<CR>", { noremap = true, silent = true, desc = "Close current buffer tab" })
map("n", "<leader>bd", "<cmd>Bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
-- Move between buffers like IDE tabs
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Previous buffer tab" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer tab" })
map("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer tab" })
map("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Previous buffer tab" })

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

-- Navigate to specific buffer tabs (like IDE)
for i = 1, 9 do
	map("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", 
		{ noremap = true, silent = true, desc = "Go to buffer tab " .. i })
end

-- Close buffer tab intelligently
map("n", "q", function()
	local buffers = vim.fn.getbufinfo({buflisted = 1})
	if #buffers > 1 then
		vim.cmd("Bdelete")
	else
		vim.notify("Only one buffer open — not closing it!", vim.log.levels.INFO)
	end
end, { noremap = true, silent = true, desc = "Close buffer tab" })

-- Set keymap here to ensure it’s defined after plugin loads
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

-- Additional IDE-like buffer tab operations
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true, desc = "Pin/unpin buffer tab" })
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", { noremap = true, silent = true, desc = "Close unpinned buffer tabs" })
map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { noremap = true, silent = true, desc = "Close buffer tabs to the right" })
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { noremap = true, silent = true, desc = "Close buffer tabs to the left" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { noremap = true, silent = true, desc = "Close other buffer tabs" })
