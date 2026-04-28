return {
   "stevearc/oil.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("oil").setup({
         view_options = {
            show_hidden = true,
         },
         keymaps = {
            ["<C-h>"] = false, -- disable to keep window navigation
            ["<C-l>"] = false,
["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
         },
      })
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
   end,
}
