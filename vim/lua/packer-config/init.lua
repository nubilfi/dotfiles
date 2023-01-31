return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> packer plugin manager
	use("norcalli/nvim-colorizer.lua") --> color highlighter 
	use("j-hui/fidget.nvim") --> progress
	use("airblade/vim-gitgutter") --> gitgutter

	-- --> colorschemes
	use("NLKNguyen/papercolor-theme")
	use("Nequo/vim-allomancer")
	use("nvim-tree/nvim-tree.lua") --> file explorer
	use("nvim-tree/nvim-web-devicons") --> enable icons
	use("nvim-lualine/lualine.nvim") --> a statusline written in lua
	use("windwp/nvim-autopairs")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim") --> Find, Filter, Preview, Pick. 
	use("rcarriga/nvim-notify")
	use("romgrk/barbar.nvim") --> tabs for neovim

	--> treesitter & treesitter modules/plugins
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("numToStr/Comment.nvim")
	use("fladson/vim-kitty") --> kitty syntax highlighting
	use("lukas-reineke/indent-blankline.nvim") --> indent guides for neovim
	use("mfussenegger/nvim-dap")
	use("akinsho/toggleterm.nvim")
	use("ggandor/lightspeed.nvim") --> motion plugin with incremental input processing, allowing for unparalleled speed with near-zero cognitive effort
	use("startup-nvim/startup.nvim")

	--> lsp
	use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
	use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
	use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") --> Snippets plugin
	use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
	use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")
end)
