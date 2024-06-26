# Nubilfi's dotfiles

### Neovim setup for Rust

I've utilized Lazy.nvim as the plugins manager for this configuration. Please refer to the official [Lazy.nvim documentation](https://github.com/folke/lazy.nvim) for precise instructions on setup by yourself, but you don't have to since you can use my setup as your starter. 

As an optional addition to this configuration, consider installing the following packages: `exuberant-ctags, git, ack-grep, fzf, xclip, xsel, wl-clipboard, and ripgrep`. Keep in mind that package names may differ across various Linux distributions, so ensure compatibility by identifying the equivalent packages in your system.

For the language server, I've integrated [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Detailed installation instructions can be found at the provided link for further insight.

Brief help:

- :checkhealth lazy - recommended to run after installation
- :Lazy - to manage Plugins

For a quick reference on mappings:

- n: normal only
- v: visual and select
- o: operator-pending
- x: visual only
- s: select only
- i: insert
- c: command-line
- l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

Hit `leader key` (`,`) to see shortcut.