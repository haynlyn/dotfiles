-- Define function for easy mapping.

local function map(mode, lhs, rhs, opts)
  -- set default value if not specified
  if opts.noremap == nil then
    opts.noremap = true
  end
  if opts.silent == nil then
    opts.silent = true
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- better up/down (how does this differ than before??)
vim.keymap.set({"n", "x"}, "j", function()
  return vim.v.count > 0 and "j" or "gj"
end, { expr = true })
vim.keymap.set({"n", "x"}, "k", function()
  return vim.v.count > 0 and "k" or "gk"
end, { expr = true })

-- keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- system clipboard
map( {"n", "v"}, "<Leader>y", '"+y', { desc = "Yank to clipboard" })
map({ "n" }, "<Leader>Y", '"+y$', { desc = "Yank line to clipboard" })

map({ "n", "v" }, "<Leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "v" }, "<Leader>P", '"+P', { desc = "Paste before from clipboard" })

-- LSP navigation
-- Auto-jump to first definition (workaround for ty returning multiple results)
vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.definition({
    on_list = function(options)
      if options.items and #options.items > 0 then
        local item = options.items[1]
        vim.cmd.edit(item.filename)
        vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
      end
    end
  })
end, { desc = "Go to definition" })
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { desc = "Go to references" })
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostics
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = "Diagnostics to quickfix" })

-- Plugin management
vim.keymap.set('n', '<leader>s', '<cmd>Lazy sync<cr>', { desc = "Lazy sync plugins" })

-- Jump to different file in jumplist (skips same-file positions)
local function jump_to_different_file(direction)
  local jumplist, pos = unpack(vim.fn.getjumplist())
  local current_buf = vim.fn.bufnr("%")

  local start, stop, step, jump_cmd
  if direction == "back" then
    start, stop, step = pos - 1, 0, -1
    jump_cmd = "\\<C-o>"
  else
    start, stop, step = pos + 1, #jumplist - 1, 1
    jump_cmd = "\\<C-i>"
  end

  for i = start, stop, step do
    local entry = jumplist[i + 1]
    if entry and entry.bufnr ~= current_buf and vim.fn.bufexists(entry.bufnr) == 1 then
      local jumps = math.abs(pos - i)
      vim.cmd('execute "normal! ' .. jumps .. jump_cmd .. '"')
      return
    end
  end
end

vim.keymap.set("n", "[f", function() jump_to_different_file("back") end, { desc = "Previous file in jumplist" })
vim.keymap.set("n", "]f", function() jump_to_different_file("forward") end, { desc = "Next file in jumplist" })
