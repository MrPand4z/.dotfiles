local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- vim.api.nvim_set_hl(0, "NeoTreeTabActive", { bold = true, fg = "#cdd6f4", bg = "#313244" })
-- vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = "#6c7086", bg = "#1e1e2e" })
-- vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "#313244" })
-- vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = "#1e1e2e" })

-- Highligh on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timout = 200 })
	end,
})

autocmd("VimResized", {
	group = augroup("resize_splits", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincdm = ")
	end,
})
