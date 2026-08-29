return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- use Treesitter when available
      disable_filetype = { "TelescopPromt", "neo-tree", "vim" },
      fast_wrap = {
        map = "<M-e>", -- Alt+e wraps the word/selection in a pair
      },
    },
  },
}
