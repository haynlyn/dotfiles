return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
            WinSeparator = {
              fg = colors.lavender,
            },
        }
      end,
      color_overrides = {
        mocha = {
            base = "#11111b",
            mantle = "#11111b",
        },
      },
      integrations = {
        notify = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")

    vim.keymap.set("n", "<leader>tb", function()
      local current = require("catppuccin").options.transparent_background
      require("catppuccin").setup(vim.tbl_deep_extend("force", require("catppuccin").options, {
        transparent_background = not current,
      }))
      vim.cmd.colorscheme("catppuccin")
    end, { desc = "Toggle transparent background" })
  end,
}
