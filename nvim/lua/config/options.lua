-- Set the leader key (Space)
-- All custom keymaps that start with <leader> will use this key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable the built-in file explorer so Neo-Tree can replace it
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- ======================
-- Line numbers
-- ======================
opt.number = true          -- Show absolute line numbers
opt.relativenumber = true  -- Show relative line numbers (useful for motions like 5j, 3k)
opt.cursorline = true      -- Highlight the line where the cursor is
opt.signcolumn = "yes"     -- Always show the sign column (prevents text shifting when diagnostics appear)

-- ======================
-- Colors
-- ======================
opt.termguicolors = true   -- Enable true color support (required by modern colorschemes)

-- ======================
-- Indentation
-- ======================
opt.expandtab = true       -- Use spaces instead of tabs
opt.shiftwidth = 2         -- Number of spaces for each indentation level
opt.tabstop = 2            -- Number of spaces a <Tab> counts for
opt.smartindent = true     -- Smart auto-indenting when starting a new line

-- ======================
-- Searching
-- ======================
opt.ignorecase = true      -- Ignore case when searching...
opt.smartcase = true       -- ...unless you type a capital letter
opt.incsearch = true       -- Show search results while typing
opt.hlsearch = true        -- Highlight all matches

-- ======================
-- Splits
-- ======================
opt.splitright = true      -- Vertical splits open to the right
opt.splitbelow = true      -- Horizontal splits open below

-- ======================
-- Scrolling
-- ======================
opt.scrolloff = 8          -- Keep 8 lines above/below the cursor when scrolling
opt.sidescrolloff = 8      -- Keep 8 columns to the left/right of the cursor

-- ======================
-- Performance & Behavior
-- ======================
opt.updatetime = 200       -- Faster completion and CursorHold events (default is 4000ms)
opt.timeoutlen = 300       -- Time to wait for a mapped sequence to complete (in ms)
opt.undofile = true        -- Persistent undo history (survives Neovim restarts)
opt.swapfile = false       -- Disable swap files (we use undofile instead)

-- ======================
-- Clipboard
-- ======================
-- "unnamedplus" makes Neovim use the system clipboard
-- Works on both Windows and Linux
opt.clipboard = "unnamedplus"
