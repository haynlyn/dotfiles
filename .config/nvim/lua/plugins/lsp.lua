return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = {
          -- "pyright",
          -- "ts_ls",
          "rust_analyzer",
          "lua_ls",
        } })
        -- require("lspconfig").pyright.setup({})
        -- require("lspconfig").ts_ls.setup({})
        require("lspconfig").rust_analyzer.setup({})
        require("lspconfig").lua_ls.setup({})
    end,
    },
  }

