local map = vim.keymap.set

-- ======================
-- Window navigation
-- ======================
-- <C-h/j/k/l> = Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- ======================
-- Search
-- ======================
-- Press Escape to clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ======================
-- Indenting (Visual mode)
-- ======================
-- Keep the selection after indenting
map("v", "<", "<gv")   -- Shift left and re-select
map("v", ">", ">gv")   -- Shift right and re-select

-- ======================
-- Move lines up / down
-- ======================
-- <A-j> and <A-k> = Alt + j / Alt + k
--
-- On Windows: hold Alt and press j or k
-- On Linux (depending on terminal): usually the same, or sometimes Meta key

-- Normal mode
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })

-- Visual mode (move the whole selection)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Toggle comment
map("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
map("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })

map("v", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })

map("i", "<C-_>", "<C-o>gcc", { remap = true, desc = "Toggle comment" })
map("i", "<C-/>", "<C-o>gcc", { remap = true, desc = "Toggle comment" })
