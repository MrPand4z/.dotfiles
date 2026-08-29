return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
      { "<leader>E", "<cmd>Neotree reveal<CR>", desc = "Reveal current file" },
      { "<leader>eg", "<cmd>Neotree git_status left<CR>", desc = "Git status sidebar" },
    },
    opts = {
      enable_git_status = true,
      git_statys_async = true,

      close_if_last_window = true,
      popup_border_style = "rounded",

      -- Tabs at the top of sidebar: Files / Buffers / Git
      source_select = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = " Files " },
          { source = "buffers", display_name = " Buffers " },
          { source = "git_status", display_name = " Git " },
        },
      },

      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false, -- set true if you want hidden files shown
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },

      window = {
        position = "left",
        width = 32,
        mappings = {
          ["e"] = "focus_filesystem", -- we can keep simple keys below instead
          ["<cr>"] = "open",
          ["l"] = "open",
          ["h"] = "close_node",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["R"] = "refresh",
          ["."] = "toggle_hidden",
        },
      },

      default_component_configs = {
        git_status = {
          symbols = {
            added = "A",
            deleted = "D",
            modified = "M",
            renamed = "R",
            untracked = "?",
            ignored = "I",
            unstaged = "U",
            staged = "+",
            conflict = "C",
          },
        },
        indent = {
          with_expanders = true,
        },
      },

      git_status = {
        window = {
          position = "left", --stay in the sidebar, not a floating window
          mappings = {
            ["A"] = "git_add_all",
            ["ga"] = "git_add_file",
            ["gu"] = "git_unstage_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
    },
  },
}
