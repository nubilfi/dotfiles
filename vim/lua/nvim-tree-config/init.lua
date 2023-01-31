require("nvim-tree").setup({
	diagnostics = {
		enable = true,
	},
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  modified = {
    enable = true,
  },
})
