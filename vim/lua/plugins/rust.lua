return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable()

            -- format on save rust_analyzer
            -- https://github.com/nvimtools/none-ls.nvim/issues/58#issuecomment-1924105768
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        }
      }
    end
  },
  -- crates
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    lazy = true,
    ft = { "rust", "toml" },
    event = { "BufRead", "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        popup = {}
      }
    end,
  },
}
