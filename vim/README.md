# Nubilfi's dotfiles

### Neovim setup for Rust & Javascript

I used Packer for the plugins manager, follow the instructions from the [Packer](https://github.com/wbthomason/packer.nvim) official documentation for setup and installation.

As an addition to this config (optional), please install these packages: `exuberant-ctags git ack-grep fzf xclip xsel wl-clipboard ripgrep`. Find that packages name according to your Linux distro, it might be different on each distro.

I'm using [lua_lsp](https://github.com/sumneko/lua-language-server) for `intellisense engine`, so please check on that link for more details about the installation. Finally, here are the list of the `packages` that I installed:

- [autopairs](https://github.com/windwp/nvim-autopairs): Autopairs
- [bufferline](https://github.com/akinsho/bufferline.nvim): Tabs for vim
- [cmp-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): LSP sourec for nvim-cmp
- [cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip): Snippets for nvim-cmp
- [commenting](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): Commenting
- [fidget](https://github.com/j-hui/fidget.nvim): Progress info
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers
- [lualine](https://github.com/nvim-lualine/lualine.nvim): Status line
- [lspconfig](https://github.com/neovim/nvim-lspconfig): Configure built-in LSP client
- [luasnip](https://github.com/L3MON4D3/LuaSnip): Snippets plugin
- [lspkind](https://github.com/onsails/lspkind.nvim): pictograms LSP completion
- [mason](https://github.com/williamboman/mason.nvim): Manage LSP server
- [motion](https://github.com/ggandor/lightspeed.nvim): Motion plugin
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): File explorer
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Icons
- [notify](https://github.com/rcarriga/nvim-notify): Notification manager
- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre):  Find the enemy and replace them with dark power. 
- [none-ls](https://github.com/nvimtools/none-ls.nvim): Diagnostics, formatting, etc.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Autocompletion plugin
- [playground](https://github.com/nvim-treesitter/playground): Vim Integrated playground
- [plenary](https://github.com/nvim-lua/plenary.nvim): Lua functions
- [refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor): Treesitter refactor module
- [rust-tools](https://github.com/simrat39/rust-tools.nvim/):  Tools for better development in rust using neovim's builtin lsp 
- [smart-comment](https://github.com/numToStr/Comment.nvim): Smart comment
- [sonokai](https://github.com/sainnhe/sonokai): Colorscheme
- [startup-screen](https://github.com/startup-nvim/startup.nvim): Vim startup screen
- [telescope](https://github.com/nvim-telescope/telescope.nvim): Find, filter, preview files
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Abstraction layer
- [textobject](https://github.com/nvim-treesitter/nvim-treesitter-textobjects): Syntax aware

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
