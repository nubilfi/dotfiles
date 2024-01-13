return {
  lua_ls = {
    Lua = {
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  bashls = {
    filetypes = { "sh", "zsh", "bash" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  rust_analyzer = {
    filetypes = { "rust"},
  },
}