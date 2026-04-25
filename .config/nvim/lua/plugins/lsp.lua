return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- "pyright",
          "ts_ls",
          "rust_analyzer",
          "lua_ls",
          "eslint",
        },
      })

      -- Configure LSP servers using native vim.lsp.config (Neovim 0.11+)
      vim.lsp.config.rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", "rust-project.json" },
      }

      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      }

      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
        init_options = { hostInfo = "neovim" },
      }

      vim.lsp.config.eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = {
          ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json",
          "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
        },
        workspace_required = true,
        init_options = { provideFormatter = false },
        settings = {
          eslint = {
            format = { enable = false },
            nodePath = vim.NIL,
          },
        },
      }

      -- Configure ty (Astral's Python LSP) - installed manually via uv/pipx
      vim.lsp.config.ty = {
        cmd = { "ty", "server" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "ty.toml", "setup.py", ".git" },
      }

      -- Configure pyright
      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "pyrightconfig.json", "setup.py", ".git" },
      }

      -- Configure ruff LSP for linting
      vim.lsp.config.ruff = {
        cmd = { "ruff", "server" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", "setup.py", ".git" },
      }

      -- Configure SQLFluff - also installed manually
      vim.lsp.config.sqlfluff = {
        cmd = { "sqlfluff-language-server" },
        filetypes = { "sql" },
        root_markers = { ".sqlfluff", "pyproject.toml", ".git" },
        settings = {
          sqlfluff = {
            dialect = "ansi",
          },
        },
      }

      -- Change sqlfluff dialect for the current buffer without editing .sqlfluff
      -- (maybe this shouldn't be done? project dependent?)
      vim.api.nvim_create_user_command("SqlSetDialect", function(args)
        local dialect = args.args
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0, name = "sqlfluff" })) do
          client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, {
            sqlfluff = { dialect = dialect },
          })
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings }) 
        end
        vim.notify("sqlfluff dialect set to: " .. dialect)
      end, {
        nargs = 1,
        desc = "Set sqlfluff dialect for current buffer",
    })

      -- Enable the configured LSP servers
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
      vim.lsp.enable("ty")
      vim.lsp.enable("ruff")
      vim.lsp.enable("sqlfluff")
    end,
  },
}

