return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto", -- follows your colorscheme
        globalstatus = true, -- one bar for the whole editor
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { 
            -- "neo-tree",
            "lazy",
          },
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
        lualine_b = {
          { 
            function()
              local function format_branch(gs)
                if not gs or not gs.head or gs.head == "" then
                  return nil
                end
                local dirty = (gs.added or 0) + (gs.changed or 0) + (gs.removed or 0)
                if dirty > 0 then
                  return gs.head .. "*"
                end
                return gs.head
              end

              local current = format_branch(vim.b.gitsigns_status_dict)
              if current then
                vim.g.statusline_branch = current
                return current
              end

              for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                local other = format_branch(vim.b[buf].gisigns_status_dict)
                if other then
                  vim.g.statusline_branch = other
                  return other
                end
              end

              return vim.g.statusline_branch or ""
            end,
            -- function()
            --   local gs = vim.b.gitsigns_status_dict
            --   if not gs or not gs.head or gs.head == "" then
            --     return ""
            --   end
            --
            --   local dirty = (gs.added or 0) + (gs.changed or 0) + (gs.removed or 0)
            --   if dirty > 0 then
            --     return gs.head .. "*"
            --   end
            --   return gs.head
            -- end,
            icon = "",
          },
          -- { "branch", icon = "" },
          {
            "diff",
            symbols = { added = "+", modified = "~", removed = "-" },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- relative path
            symbols = { modified = "●", readonly = "", unnamed = "[No Name]" },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
          },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
