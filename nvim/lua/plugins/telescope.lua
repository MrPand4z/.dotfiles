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
    opts = function ()
      local actions_layout = require("telescope.actions.layout")
      return {
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
            -- vertical = { widht = 0.5 },
            horizontal = {
              prompt_position = "top",
              width = { padding = 0.05 },
              height = { padding = 0.05 },
            },
          },
          preview = {
            hide_on_startup = true,
          },
          sorting_strategy = "ascending",
          prompt_prefix = "> ",
          selection_caret = "> ",
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-q>"] = "close",
              ["<C-p>"] = actions_layout.toggle_preview -- Ctrl + p toggle preview
            },
            n = {
              ["<C-q>"] = "close",
              ["<C-p>"] = actions_layout.toggle_preview -- Ctrl + p toggle preview
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- include dotfiles
          },
          live_grep = {
            preview = {
              hide_on_startup = false -- Preview open for live_grep
            },
          },
        },
      }
    end,
  },
}
