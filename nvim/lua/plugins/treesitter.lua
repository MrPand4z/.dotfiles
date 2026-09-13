return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- keep the familiar API (ensure_installed)
    lazy = false, -- treesitter should not be lazy-loaded
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Parsers you want installed automatically
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "bash",
          "json",
          "yaml",
          "toml",
        },

        -- Install missing parser when you open a file
        auto_install = true,

        -- Do not install synchronously on first startup
        -- (can freeze Neovim, especially on Windows
        sync_install = false,

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },
      })
    end,
  },
}
