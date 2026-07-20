return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- In Neovim 0.12+, treesitter is built-in
      -- Highlighting and indentation work automatically

      -- Ensure parsers are installed
      local parsers = {
        "bash", "toml", "sql", "json", "markdown", "markdown_inline",
        "query", "regex", "rust", "lua", "python"
      }

      -- Install parsers if not already installed
      for _, parser in ipairs(parsers) do
        local parser_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser/" .. parser .. ".so"
        if vim.fn.filereadable(parser_path) == 0 then
          vim.cmd("TSInstall " .. parser)
        end
      end

      -- Setup basic treesitter textobjects using built-in vim.treesitter API
      -- simplified versions without the textobjects plugin

      -- Function to select treesitter node
      local function select_node(query_string)
        local bufnr = vim.api.nvim_get_current_buf()
        local node = vim.treesitter.get_node()
        if not node then return end

        -- Try to find parent node matching the query
        local query_type = query_string:match("@(%w+)")
        while node do
          local node_type = node:type()
          if node_type:match(query_type) then
            local start_row, start_col, end_row, end_col = node:range()
            vim.api.nvim_buf_set_mark(bufnr, "<", start_row + 1, start_col, {})
            vim.api.nvim_buf_set_mark(bufnr, ">", end_row + 1, end_col - 1, {})
            vim.cmd("normal! gv")
            return
          end
          node = node:parent()
        end
      end

      -- Basic textobject keymaps using built-in treesitter
      vim.keymap.set({"x", "o"}, "af", function()
        select_node("@function")
      end, { desc = "around a function" })

      vim.keymap.set({"x", "o"}, "ac", function()
        select_node("@class")
      end, { desc = "around a class" })

      -- Navigation keymaps
      vim.keymap.set("n", "]f", function()
        vim.cmd("normal! ]m")
      end, { desc = "Next function" })

      vim.keymap.set("n", "[f", function()
        vim.cmd("normal! [m")
      end, { desc = "Previous function" })

      -- Incremental selection
      vim.keymap.set("n", "<leader>vv", function()
        local node = vim.treesitter.get_node()
        if node then
          local start_row, start_col, end_row, end_col = node:range()
          vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
          vim.cmd("normal! v")
          vim.api.nvim_win_set_cursor(0, {end_row + 1, end_col - 1})
        end
      end, { desc = "Select treesitter node" })

      vim.keymap.set("v", "+", function()
        -- Expand selection to parent node
        vim.cmd("normal! o")
        local node = vim.treesitter.get_node()
        if node and node:parent() then
          local parent = node:parent()
          local start_row, start_col, end_row, end_col = parent:range()
          vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
          vim.cmd("normal! o")
          vim.api.nvim_win_set_cursor(0, {end_row + 1, end_col - 1})
        end
      end, { desc = "Expand selection" })
    end,
  },
}
