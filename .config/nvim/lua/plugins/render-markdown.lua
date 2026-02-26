return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  opts = {
    heading = {
      enabled = true,
      sign = true,
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
    },
    code = {
      enabled = true,
      sign = true,
      style = "full",
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰱒 " },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
        canceled = { raw = "[~]", rendered = "󰰱 ", highlight = "RenderMarkdownError" },
        forwarded = { raw = "[>]", rendered = " ", highlight = "RenderMarkdownHint" },
        important = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownError" },
      },
    },
    quote = {
      enabled = true,
      icon = "▎",
    },
    indent = {
      enabled = true,
      icon = "▎",
      per_level = 2,
    },
  },
}
