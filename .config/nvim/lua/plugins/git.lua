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
         -- Navigation
         vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
         vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })
         -- Hunk actions
         vim.keymap.set("n", "<leader>Hs", gs.stage_hunk, { desc = "Stage hunk" })
         vim.keymap.set("v", "<leader>Hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
         vim.keymap.set("n", "<leader>Hr", gs.reset_hunk, { desc = "Reset hunk" })
         vim.keymap.set("v", "<leader>Hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
         vim.keymap.set("n", "<leader>Hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
         vim.keymap.set("n", "<leader>Hp", gs.preview_hunk, { desc = "Preview hunk" })
         -- Buffer actions
         vim.keymap.set("n", "<leader>GS", gs.stage_buffer, { desc = "Stage buffer" })
         vim.keymap.set("n", "<leader>GR", gs.reset_buffer, { desc = "Reset buffer" })
         -- Blame & diff
         vim.keymap.set("n", "<leader>Gb", gs.toggle_current_line_blame, { desc = "Toggle inline blame" })
         vim.keymap.set("n", "<leader>GB", function() gs.blame_line({ full = true }) end, { desc = "Git blame popup" })
         vim.keymap.set("n", "<leader>Gd", gs.diffthis, { desc = "Diff this" })
         vim.keymap.set("n", "<leader>Gt", gs.toggle_deleted, { desc = "Toggle deleted lines" })
         -- Text object
         vim.keymap.set({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select hunk" })
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
