return {
	{
		"catppuccin/nvim",
    name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavor = "frappe", -- or "latte", "mocha", "macchiato"
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
