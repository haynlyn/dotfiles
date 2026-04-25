vim.opt.mousemoveevent = true

-- enable line number and disable relative line number
vim.opt.number = true
vim.opt.relativenumber = false

-- highlight the line of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"


-- width of a tab
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- use number of spaces to insert a \t
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- test with cursor-styling
vim.opt.guicursor = ""

vim.opt.termguicolors = true

-- don't persist jump list across sessions (keeps jumps session-local)
vim.opt.shada = "!,'0,<50,s10,h"
