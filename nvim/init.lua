-- Load Core config first
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap lazy.nvim and load the rest
require("config.lazy")
