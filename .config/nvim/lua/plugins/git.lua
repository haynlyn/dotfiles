return {
   {
      "lewis6991/gitsigns.nvim",
      opts = {
         current_line_blame = true,
         current_line_blame_opts = {
            delay = 300,
         },
      },
      init = function()
         local gs = require("gitsigns")
         vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
         vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })
         vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
         vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
         vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
         vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
      end,
   },
   {
      "kdheepak/lazygit.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      init = function()
         vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
      end,
   },
}
