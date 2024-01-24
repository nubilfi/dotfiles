return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  keys = {
    { "<C-zf>", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    { "<C-z>",  ":Neotree toggle left<CR>",  silent = true, desc = "Left File Explorer" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "single",
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
          { source = "filesystem", display_name = "" .. " File" },
          { source = "buffers", display_name = "󰈙" .. " Bufs" },
          { source = "git_status", display_name = "󰊢" .. " Git" },
          { source = "diagnostics", display_name = "󰒡" .. " Diagnostic" },
        },
      },
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
          padding = 0,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          default = "󰈙",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            -- Status type
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      window = {
        position = "float",
        width = 30,
      },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            "target",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
      },
    })
  end,
}