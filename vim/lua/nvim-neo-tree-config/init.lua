--- The following setup is from https://github.com/AstroNvim/AstroNvim
vim.g.neo_tree_remove_legacy_commands = true

--- Open a URL under the cursor with the current operating system
---@param path string The path of the file to open with the system opener
function system_open(path)
  -- TODO: REMOVE WHEN DROPPING NEOVIM <0.10
  if vim.ui.open then return vim.ui.open(path) end
  local cmd
  if vim.fn.has "win32" == 1 and vim.fn.executable "explorer" == 1 then
    cmd = { "cmd.exe", "/K", "explorer" }
  elseif vim.fn.has "unix" == 1 and vim.fn.executable "xdg-open" == 1 then
    cmd = { "xdg-open" }
  elseif (vim.fn.has "mac" == 1 or vim.fn.has "unix" == 1) and vim.fn.executable "open" == 1 then
    cmd = { "open" }
  end
  if not cmd then notify("Available system opening tool not found!", vim.log.levels.ERROR) end
  vim.fn.jobstart(vim.fn.extend(cmd, { path or vim.fn.expand "<cfile>" }), { detach = true })
end

--- Serve a notification with a title
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function notify(msg, type, opts)
  vim.schedule(function() vim.notify(msg, type, extend_tbl({ title = "NeoVim" }, opts)) end)
end

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

require("neo-tree").setup({
  auto_clean_after_session_restore = true,
  close_if_last_window = true,
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
    indent = { padding = 0 },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      folder_empty_open = "",
      default = "󰈙",
    },
    modified = { symbol = "" },
    git_status = {
      symbols = {
        added = "",
        deleted = "",
        modified = "",
        renamed = "➜",
        untracked = "★",
        ignored = "◌",
        unstaged = "✗",
        staged = "✓",
        conflict = "",
      }
    }
  },
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_) vim.opt_local.signcolumn = "auto" end,
    },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      ["[b"] = "prev_source",
      ["]b"] = "next_source",
      -- F = utils.is_available "telescope.nvim" and "find_in_dir" or nil,
      -- O = "system_open",
      -- Y = "copy_selector",
      -- h = "parent_or_close",
      -- l = "child_or_open",
      -- o = "open",
    }
    -- fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
    --   ["<C-j>"] = "move_cursor_down",
    --   ["<C-k>"] = "move_cursor_up",
    -- },
  },
  commands = {
    system_open = function(state)
      -- TODO: just use vim.ui.open when dropping support for Neovim <0.10
      (vim.ui.open or system_open)(state.tree:get_node():get_id())
    end,
    parent_or_close = function(state)
      local node = state.tree:get_node()
      if (node.type == "directory" or node:has_children()) and node:is_expanded() then
        state.commands.toggle_node(state)
      else
        require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
      end
    end,
    child_or_open = function(state)
      local node = state.tree:get_node()
      if node.type == "directory" or node:has_children() then
        if not node:is_expanded() then -- if unexpanded, expand
          state.commands.toggle_node(state)
        else -- if expanded and has children, seleect the next child
          require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
        end
      else -- if not a directory just open it
        state.commands.open(state)
      end
    end,
    copy_selector = function(state)
      local node = state.tree:get_node()
      local filepath = node:get_id()
      local filename = node.name
      local modify = vim.fn.fnamemodify

      local vals = {
        ["BASENAME"] = modify(filename, ":r"),
        ["EXTENSION"] = modify(filename, ":e"),
        ["FILENAME"] = filename,
        ["PATH (CWD)"] = modify(filepath, ":."),
        ["PATH (HOME)"] = modify(filepath, ":~"),
        ["PATH"] = filepath,
        ["URI"] = vim.uri_from_fname(filepath),
      }

      local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
      if vim.tbl_isempty(options) then
        notify("No values to copy", vim.log.levels.WARN)
        return
      end
      table.sort(options)
      vim.ui.select(options, {
        prompt = "Choose to copy to clipboard:",
        format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
      }, function(choice)
        local result = vals[choice]
        if result then
          notify(("Copied: `%s`"):format(result))
          vim.fn.setreg("+", result)
        end
      end)
    end,
    find_in_dir = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      require("telescope.builtin").find_files {
        cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
      }
    end,
  },
})
