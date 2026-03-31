return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        json = { "jq" },
        markdown = { "prettier" },
        python = { "ruff_format" },
      },
      format_on_save = function(bufnr)
        local filetype = vim.bo[bufnr].filetype
        local enabled_filetypes = { markdown = true, python = true }
        if enabled_filetypes[filetype] then
          return { timeout_ms = 500, lsp_format = "fallback" }
        end
        return nil
      end,
    },
  },
}
