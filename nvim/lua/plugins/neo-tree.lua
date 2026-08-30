local function open_explorer_if_started_with_dir()
  local arg = vim.fn.argv(0)
  if arg == nil or arg == "" then
    return
  end

  if vim.fn.isdirectory(arg) ~= 1 then
    return
  end

  vim.schedule(function()
    require("neo-tree.command").execute({
      action = "focus",
      source = "filesystem",
      position = "float",
      dir = vim.fn.fnamemodify(arg, ":p"),
    })
  end)
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle left<CR>", desc = "Toggle file sidebar" },
      { "<leader>E", "<cmd>Neotree reveal left<CR>", desc = "Reveal current file" },
      { "<leader>eg", "<cmd>Neotree git_status left<CR>", desc = "Git status sidebar" },
    },
    opts = {
      enable_git_status = true,
      git_status_async = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = " Files " },
          { source = "buffers", display_name = " Buffers " },
          { source = "git_status", display_name = " Git " },
        },
      },
      filesystem = {
        hijack_netrw_behavior = "disabled",
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        components = {
          git_bar = function(config, node, state)
            config = vim.tbl_deep_extend("force", config or {}, {
              symbols = {
                added = "▎",
                deleted = "▁",
                modified = "▎",
                renamed = "▎",
                untracked = "▎",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "▎",
              },
            })

            local git = require("neo-tree.sources.common.components").git_status(config, node, state)
            if git == nil or vim.tbl_isempty(git) then
              return { text = " " }
            end

            -- single component: { text = "...", highlight = "..." }
            if git.text then
              if vim.trim(git.text) == "" then
                return { text = " " }
              end
              return {
                text = "▎",
                highlight = git.highlight,
              }
            end

            -- list of components: { { text = "...", highlight = "..." }, ... }
            local first = git[1]
            if first and first.highlight then
              local mark = (first.text and vim.trim(first.text):find("▁")) and "▁" or "▎"
              return {
                text = mark,
                highlight = first.highlight,
              }
            end

            return { text = " " }
          end,
        },
        renderers = {
          file = {
            { "git_bar" },
            { "indent" },
            { "icon" },
            { "name" },
            { "diagnostics" },
          },
          directory = {
            { "git_bar" },
            { "indent" },
            { "icon" },
            { "name" },
            { "diagnostics" },
          },
        },
      },
      window = {
        position = "left",
        width = 32,
        popup = {
          size = { width = "60%", height = "70%" },
          position = "50%",
        },
        mappings = {
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
          align = "left",
          symbols = {
            -- change-type
            added = "▎",
            deleted = "▁",
            modified = "▎",
            renamed = "▎",
            -- status only
            untracked = "▎",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "▎",
            -- untracked = "", -- ?
            -- ignored   = "", -- skipped
            -- unstaged  = "", -- modified
            -- staged    = "", -- check
            -- conflict  = "", -- warning
          },
        },
        indent = {
          with_expanders = true,
        },
      },
      git_status = {
        window = {
          position = "left",
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
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = open_explorer_if_started_with_dir,
      })

      -- After the lazy UI is closed, try again
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lazy",
        callback = function(ev)
          vim.api.nvim_create_autocmd("WinClosed", {
            buffer = ev.buf,
            once = true,
            callback = function()
              vim.schedule(open_explorer_if_started_with_dir)
            end,
          })
        end,
      })
    end,
    config = function(_, opts)
      require("neo-tree").setup(opts)
      if vim.v.vim_did_enter == 1 then
        open_explorer_if_started_with_dir()
      end
    end,
  },
}
