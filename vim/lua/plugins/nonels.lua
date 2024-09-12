return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
    },
    config = function()
      require("null-ls").register(require("none-ls-shellcheck.diagnostics"))
      require("null-ls").register(require("none-ls-shellcheck.code_actions"))

      local mason_null_ls = require("mason-null-ls")
      local null_ls = require("null-ls")
      local null_ls_utils = require("null-ls.utils")

      mason_null_ls.setup({
        ensure_installed = {
          "stylua",     -- lua formatter
          "shellcheck", -- shell linter
          "buf",        -- buf formatter
          "shfmt",      -- shell formatter
          "spell",      -- spell checker
          "taplo",      -- toml
        },
      })

      local formatting = null_ls.builtins.formatting
      -- local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git"),

        sources = {
          formatting.stylua,
          formatting.buf,
          formatting.shfmt,

          code_actions.gitsigns,
          code_actions.refactoring,
        },
        -- configure format on save
        on_attach = function(current_client, bufnr)
          if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  filter = function(client)
                    --  only use null-ls for formatting instead of lsp server
                    return client.name == "null-ls"
                  end,
                  bufnr = bufnr,
                })
              end,
            })
          end
        end,
      })
    end,
  },
}
