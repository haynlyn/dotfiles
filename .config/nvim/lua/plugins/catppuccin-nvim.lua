return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
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
  },
  init = function()
      vim.cmd.colorscheme("catppuccin")
  end,
}
