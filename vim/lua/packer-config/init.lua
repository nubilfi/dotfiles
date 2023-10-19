return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> packer plugin manager

	--> colorschemes
	use("sainnhe/sonokai")
	
	--> misc
	use("lewis6991/gitsigns.nvim") --> Git integration for buffers 
	use("nvim-tree/nvim-web-devicons") --> file icons
	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
	--use("dstein64/vim-startuptime")
	use("nvim-lua/plenary.nvim") --> Lua functions
	use("nvim-pack/nvim-spectre") --> find and replace
	use {
	  "nvim-lualine/lualine.nvim",
	  requires = { "nvim-tree/nvim-web-devicons", opt = true }
	} --> a statusline written in lua
	use("windwp/nvim-autopairs") --> ({["''"]})
	use {
	  "nvim-telescope/telescope.nvim", branch = "0.1.x",
	  requires = { {"nvim-lua/plenary.nvim"} }
	} --> Find, Filter, Preview, Pick. 
	use("rcarriga/nvim-notify") --> notification manager
	use("akinsho/bufferline.nvim") --> tabs for neovim

	--> treesitter & treesitter modules/plugins
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter", requires = "nvim-treesitter/nvim-treesitter" }) --> syntax aware
	use("nvim-treesitter/nvim-treesitter-refactor") --> refactor module
	use("nvim-treesitter/playground") --> playground integrated

	use("simrat39/rust-tools.nvim") --> better development in rust
	use {
		"saecki/crates.nvim",
	    requires = { "nvim-lua/plenary.nvim" }
	} --> managing crates.io dependencies
	use("numToStr/Comment.nvim") --> easy for comment
	use("mfussenegger/nvim-dap") --> debug adapter protocol

	--> lsp
	use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
	use("nvimtools/none-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, etc. (null-ls.nvim Reloaded, maintained by the community).
	use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") --> Snippets plugin
	use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) --> manage LSP servers
	use("williamboman/mason-lspconfig.nvim") --> extension to mason
	use({"j-hui/fidget.nvim",  tag = "legacy" }) --> lsp progress
	use {
  	"hinell/lsp-timeout.nvim",
    requires= { "neovim/nvim-lspconfig" }
  } --> Start/stop LSP servers upon demand
end)
