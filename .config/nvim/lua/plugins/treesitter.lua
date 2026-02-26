return {
   {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      build = ":TSUpdate",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("nvim-treesitter").setup({
            auto_install = true,
            ensure_installed = {
               "c",
               "cpp",
               "python",
               "lua",
               "vim",
               "astro",
               "html",
               "css",
               "comment",
               "vimdoc",
               "javascript",
               "typescript",
               "tsx",
               "dockerfile",
               "rust",
               "bash",
            },
         })

         -- Highlighting and indent are now native in Neovim
         vim.api.nvim_create_autocmd("FileType", {
            callback = function()
               pcall(vim.treesitter.start)
            end,
         })
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         local ts_select = require("nvim-treesitter-textobjects.select")

         -- Function textobjects
         vim.keymap.set({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end)
         vim.keymap.set({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end)

         -- Class textobjects
         vim.keymap.set({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end)
         vim.keymap.set({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end)
      end,
   },
}
