-- Set leader keys first (before loading plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load more configurations
require("core.options")
require("core.keymaps")
require("config.lazy")
