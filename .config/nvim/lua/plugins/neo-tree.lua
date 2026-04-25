return {
   "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
   },
   keys = { { "<leader>e", "<cmd>Neotree toggle reveal_force_cwd=true<cr>", desc = "Toggle file explorer" } },
   config = function()
      require("neo-tree").setup({
         close_if_last_window = true,
         window = {
            width = 30,
            position = "left",
         },
         filesystem = {
            filtered_items = {
               visible = true,
               hide_dotfiles = false,
               hide_gitignored = false,
            },
            follow_current_file = { enabled = true },
         },
         event_handlers = {
            {
               event = "file_open_requested",
               handler = function()
                  require("neo-tree.command").execute({ action = "close" })
               end,
            },
         },
      })
   end,
}

