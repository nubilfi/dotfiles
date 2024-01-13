return {
  "j-hui/fidget.nvim",
  tag = "v1.2.0",
  config = function()
    require("fidget").setup({
      progress = {
        display = {
          progress_icon = { pattern = "dots", period = 1 },
          render_limit = 3,
        }
      }
    })
  end,
}