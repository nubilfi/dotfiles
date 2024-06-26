return {
	-- LSP progress messages
	{
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
	},

	-- comments
	{
	  "numToStr/Comment.nvim",
	  opts = {},
	  lazy = false,
	},

	-- Add/change/delete surrounding delimiter pairs with ease.
	{
	  "kylechui/nvim-surround",
	  version = "*",
	  event = "VeryLazy",
	  config = function()
	    require("nvim-surround").setup()
	  end,
	}
}