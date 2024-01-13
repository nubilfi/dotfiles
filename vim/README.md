# Nubilfi's dotfiles

### Neovim setup for Rust

I've utilized Lazy.nvim as the plugins manager for this configuration. Please refer to the official [Lazy.nvim documentation](https://github.com/folke/lazy.nvim) for precise instructions on setup by yourself, but you don't have to since you can use my setup as your starter. 

As an optional addition to this configuration, consider installing the following packages: `exuberant-ctags, git, ack-grep, fzf, xclip, xsel, wl-clipboard, and ripgrep`. Keep in mind that package names may differ across various Linux distributions, so ensure compatibility by identifying the equivalent packages in your system.

For the language server, I've integrated [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Detailed installation instructions can be found at the provided link for further insight.

Brief help:

- :checkhealt lazy - recommended to run after installation
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
| normal |  Ctrl + z  | toggle sidebar                       |
| normal | comma + ff | find file (fzf)                      |
| insert |    tab     | navigate the completion (down)       |
