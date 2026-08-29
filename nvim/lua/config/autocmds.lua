local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

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
