local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map 'jk' to escape insert mode
map("i", "jk", "<Esc>l", opts)

-- Common movement
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", function()
	local buffers = vim.fn.getbufinfo({buflisted = 1})
	if #buffers > 1 then
		vim.cmd("Bdelete")
	else
		vim.notify("Only one buffer open — not closing it!", vim.log.levels.INFO)
	end
end, { noremap = true, silent = true, desc = "Close current buffer tab" })
-- Close buffer tab (IDE-like)
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

-- Removed duplicate <leader>w mapping

-- Removed duplicate <leader>q mapping that was causing tabclose conflicts

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
		vim.cmd("bdelete")
	else
		vim.notify("Only one buffer open — not closing it!", vim.log.levels.INFO)
	end
end, { noremap = true, silent = true, desc = "Close buffer tab" })

-- Set keymap here to ensure it’s defined after plugin loads
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

-- LSP and diagnostics
map("n", "<leader>d", function()
	vim.diagnostic.open_float(nil, {
		focusable = true,
		border = "rounded",
		source = "always",
		wrap = true,
		max_width = 120,
	})
end, { desc = "Show full diagnostic message" })

-- Additional IDE-like buffer tab operations
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true, desc = "Pin/unpin buffer tab" })
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", { noremap = true, silent = true, desc = "Close unpinned buffer tabs" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { noremap = true, silent = true, desc = "Close other buffer tabs" })

-- Buffer tab movement (equivalent to tabmove)
map("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move buffer tab left" })
map("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer tab right" })

-- Custom tabmove commands that work with bufferline
vim.api.nvim_create_user_command('Tabmove', function(opts)
	local arg = opts.args
	if arg == '-1' then
		vim.cmd('BufferLineMovePrev')
	elseif arg == '+1' or arg == '1' then
		vim.cmd('BufferLineMoveNext')
	elseif arg == '0' then
		-- Move to first position - bufferline doesn't have direct command, so we move to start
		for _ = 1, 10 do  -- Move left multiple times to reach start
			vim.cmd('BufferLineMovePrev')
		end
	else
		-- For specific positions, try to move to that buffer position
		local pos = tonumber(arg)
		if pos then
			vim.cmd('BufferLineGoToBuffer ' .. (pos + 1)) -- BufferLine uses 1-based indexing
		end
	end
end, { nargs = 1, desc = "Move buffer tab (bufferline equivalent of tabmove)" })
