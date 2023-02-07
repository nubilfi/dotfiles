# Nubilfi's dotfiles

### Neovim setup for Rust & Javascript

I used Packer for the plugins manager, follow the instructions from the [Packer](https://github.com/wbthomason/packer.nvim) official documentation for setup and installation.

As an addition to this config (optional), please install these packages: `exuberant-ctags git ack-grep fzf xclip xsel wl-clipboard`. Find that packages name according to your Linux distro, it might be different on each distro.

I'm using [lua_lsp](https://github.com/sumneko/lua-language-server) for `intellisense engine`, so please check on that link for more details about the installation. Finally, here are the list of the `packages` that I installed:

- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua): Color highlighter
- [fidget](https://github.com/j-hui/fidget.nvim): Progress info
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter): Git diff markes
- [papercolor-theme](https://github.com/NLKNguyen/papercolor-theme): Colorscheme
- [allomancer](https://github.com/Nequo/vim-allomancer): Colorscheme
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua): File explorer
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Icons
- [lualine](https://github.com/nvim-lualine/lualine.nvim): Status line
- [autopairs](https://github.com/windwp/nvim-autopairs): Autopairs
- [plenary](https://github.com/nvim-lua/plenary.nvim): Lua functions
- [telescope](https://github.com/nvim-telescope/telescope.nvim): Find, filter, preview files
- [notify](https://github.com/rcarriga/nvim-notify): Notification manager
- [tabline](https://github.com/kdheepak/tabline.nvim): Tabs for vim
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Abstraction layer
- [textobject](https://github.com/nvim-treesitter/nvim-treesitter-textobjects): Syntax aware
- [refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor): Treesitter refactor module
- [rainbow](https://github.com/p00f/nvim-ts-rainbow): Rainbow pairs
- [playground](https://github.com/nvim-treesitter/playground): Vim Integrated playground
- [commenting](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): Commenting
- [smart-comment](https://github.com/numToStr/Comment.nvim): Smart comment
- [indent](https://github.com/lukas-reineke/indent-blankline.nvim): Indentation
- [debug](https://github.com/mfussenegger/nvim-dap): Debug
- [terminal](https://github.com/akinsho/toggleterm.nvim): Terminal
- [motion](https://github.com/ggandor/lightspeed.nvim): Motion plugin
- [startup-screen](https://github.com/startup-nvim/startup.nvim): Vim startup screen
- [lspconfig](https://github.com/neovim/nvim-lspconfig): Configure built-in LSP client
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim): Diagnostics, formatting, etc.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Autocompletion plugin
- [cmp-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): LSP sourec for nvim-cmp
- [cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip): Snippets for nvim-cmp
- [luasnip](https://github.com/L3MON4D3/LuaSnip): Snippets plugin
- [lspsaga](https://github.com/kkharji/lspsaga.nvim): Icons for LSP diagnostics
- [lspkind](https://github.com/onsails/lspkind.nvim): pictograms LSP completion
- [mason](https://github.com/williamboman/mason.nvim): Manage LSP server


Brief help:

- :PackerInstall - installs plugins
- :PackerClean - confirms removal of unused plugins

Here are some information about mappings:

- n: normal only
- v: visual and select
- o: operator-pending
- x: visual only
- s: select only
- i: insert
- c: command-line
- l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

|  MODE  | SHORTCUTS  | DESCRIPTIONS                         |
| :----: | :--------: | ------------------------------------ |
| normal | comma + N  | toggle line numbers                  |
| normal | comma + ss | to save                              |
| normal | comma + q  | quit without saving                  |
| normal | comma + qa | quit all without saving              |
| normal | comma + Y  | copy to clipboard                    |
| normal | comma + q  | back to normal mode                  |
| insert | comma + jj | back to normal mode                  |
| normal | comma + a  | to fold                              |
| normal |     tn     | new tab                              |
| normal |     tk     | next tab                             |
| normal |     tj     | previous tab                         |
| normal |     th     | first tab                            |
| normal |     tl     | last tab                             |
| normal |     tc     | close tab                            |
| normal | comma + l  | navigate to the next buffer          |
| normal | comma + h  | navigate to the previous buffer      |
| normal | comma + 0  | navigate to the first buffer         |
| normal | comma + dd | delete current buffer                |
| normal |  Ctrl + k  | navigate to the up split screen      |
| normal |  Ctrl + j  | navigate to the down split screen    |
| normal |  Ctrl + l  | navigate to the left split screen    |
| normal |  Ctrl + h  | navigate to the right split screen   |
| normal | Shift + >> | indent line to the right             |
| normal | Shift + << | indent line to the left              |
| normal | Shift + Y  | yank to the end of line              |
| normal |   Y + p    | Duplicate line (Sublime like Ctrl+d) |
| normal |  Ctrl + b  | toggle sidebar                       |
| normal | comma + ff | find file (fzf)                      |
| insert |    tab     | navigate the completion (down)       |
