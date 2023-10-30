# Nubilfi's dotfiles

### Neovim setup for Rust

I used Packer for the plugins manager, follow the instructions from the [Packer](https://github.com/wbthomason/packer.nvim) official documentation for setup and installation.

As an addition to this config (optional), please install these packages: `exuberant-ctags git ack-grep fzf xclip xsel wl-clipboard ripgrep`. Find that packages name according to your Linux distro, it might be different on each distro.

I'm using [lua_lsp](https://github.com/sumneko/lua-language-server) for `intellisense engine`, so please check on that link for more details about the installation. List of installed `plugins` is on [this file](https://github.com/nubilfi/dotfiles/blob/master/vim/lua/packer-config/init.lua).

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
