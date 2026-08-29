return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search in files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Open buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
      { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
    },
    opts = {
      defaults = {
       file_ignore_patterns = {
          "%.git[/\\]",
          "[/\\]%.git[/\\]",
          "node_modules[/\\]",
          "dist[/\\]",
          "build[/\\]",
          "%.lock",
        },
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sortin_stategy = "ascending",
        prompt_prefix = "> ",
        selection_caret = "> ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-q>"] = "close",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- include dotfiles
        },
      },
    },
  },
}
