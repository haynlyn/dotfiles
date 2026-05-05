return {
   {
      "m4xshen/autoclose.nvim",
      opts = {
         keys = {
            ["'"] = { escape = true, close = false, pair = "''" },
         },
         options = {
            disabled_filetypes = { "text" },
            disable_when_touch = true,
            pair_spaces = true,
         },
      },
   },
   "windwp/nvim-ts-autotag",
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
         vim.g.nvim_surround_no_normal_mappings = true
         require("nvim-surround").setup()
         vim.keymap.set("n", "gs", "<Plug>(nvim-surround-normal)", { desc = "Add surround (motion)" })
         vim.keymap.set("n", "gss", "<Plug>(nvim-surround-normal-cur)", { desc = "Add surround (line)" })
         vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", { desc = "Change surround" })
         vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", { desc = "Delete surround" })
         vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual)", { desc = "Add surround (visual)" })
      end,
   },
}
