return {
   {
      "nvim-telescope/telescope.nvim",
      branch = "master",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
         defaults = {
            file_ignore_patterns = { "node_modules", ".git", ".next" },
         },
      },
      init = function()
         local builtin = require("telescope.builtin")
         vim.keymap.set("n", "<leader>f", function()
            builtin.find_files({
               hidden = true,
               no_ignore = true,
            })
         end, { desc = "Find files" })
         vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live grep" })
         vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
         vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Help tags" })
         vim.keymap.set("n", "<leader>r", function()
            builtin.live_grep({
               prompt_title = "Search README",
               search_dirs = { vim.fn.expand("~/.config/nvim") },
               glob_pattern = "README.md",
            })
         end, { desc = "Search nvim README" })
         vim.keymap.set("n", "<leader>j", builtin.jumplist, { desc = "Jumplist" })
      end,
   },
   {
      "piersolenski/telescope-import.nvim",
      branch = "main",
      dependencies = "nvim-telescope/telescope.nvim",
      config = function()
         require("telescope").load_extension("import")
         vim.keymap.set("n", "<leader>i", ":Telescope import<cr>", { desc = "Import" })
      end,
   },
}
