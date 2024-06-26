return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      { 'juansalvatore/git-dashboard-nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    opts = function()
      local git_dashboard = require('git-dashboard-nvim').setup {}

      local opts = {
        theme = 'doom',
        config = {
          header = git_dashboard,
          center = {
            { action = '', desc = '', icon = '', key = 'n' },
          },
          footer = function()
            return {}
          end,
        },
      }

      -- extra dashboard nvim config ...

      return opts
    end,
}