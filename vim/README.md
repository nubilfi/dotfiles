# Nubilfi's dotfiles

### Vim/Neovim as Python & Javascript IDE

I used Vim-Plug for the plugins manager, follow the instructions from the [Plug](https://github.com/junegunn/vim-plug) official documentation for setup and installation.

As an addition to this config (optional), please install these packages: `exuberant-ctags git ack-grep fzf python2-pip python-pynvim xclip xsel wl-clipboard the_silver_searcher`. Find that packages name according to your Linux distro, it might be different on each distro (I'll keep Python2.x support).

Next step is to install the following dependencies (for Python support): `pip install pep8 flake8 pyflakes isort yapf jedi`, `pip2 install pynvim jedi` (specific for Python2.x support), and also don't forget to patch icon to be able to show the icon files, please follow [vim-devicons](https://github.com/ryanoasis/vim-devicons) instructions.

Also, please install neovim javascript package globally: `npm i -g neovim typescript typescript-language-server`.

I'm using [coc.nvim](https://github.com/neoclide/coc.nvim) for `intellisense engine`, so please check on that link for more details about the installation. And here are the list of `coc.nvim` extensions that i used:

- coc-tsserver
- coc-snippets
- coc-pairs
- coc-python
- coc-json
- coc-html
- coc-highlight
- coc-css
- coc-markdownlint (optional)
- coc-import-cost (optionnal)
- coc-docker (optional)
- coc-yank (optional)
- coc-styled-components (optional)
- coc-sql (optional)

Brief help:

- :PlugInstall    - installs plugins; to update :PlugUpdate
- :PlugClean      - confirms removal of unused plugins

Here are some information about mappings:

- n: normal only
- v: visual and select
- o: operator-pending
- x: visual only
- s: select only
- i: insert
- c: command-line
- l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

|     MODE      | SHORTCUTS  | DESCRIPTIONS                                  |
| :-----------: | :--------: | --------------------------------------------- |
|    normal     | comma + N  | toggle line numbers                           |
|    normal     | comma + ss | to save                                       |
|    normal     | comma + q  | quit without saving                           |
|    normal     | comma + qa | quit all without saving                       |
|    normal     | comma + rv | reload vimrc                                  |
|    normal     | comma + ev | edit vimrc                                    |
|    normal     | comma + Y  | copy to clipboard                             |
|    normal     | comma + q  | back to normal mode                           |
|    insert     | comma + jj | back to normal mode                           |
|    normal     | comma + z  | to fold                                       |
|    normal     |     tn     | new tab                                       |
|    normal     |     tk     | next tab                                      |
|    normal     |     tj     | previous tab                                  |
|    normal     |     th     | first tab                                     |
|    normal     |     tl     | last tab                                      |
|    normal     |     tc     | close tab                                     |
|    normal     | comma + l  | navigate to the next buffer                   |
|    normal     | comma + h  | navigate to the previous buffer               |
|    normal     | comma + 0  | navigate to the first buffer                  |
|    normal     | comma + dd | delete current buffer                         |
|    normal     |  Ctrl + k  | navigate to the up split screen               |
|    normal     |  Ctrl + j  | navigate to the down split screen             |
|    normal     |  Ctrl + l  | navigate to the left split screen             |
|    normal     |  Ctrl + h  | navigate to the right split screen            |
|    normal     | Shift + >> | indent line to the right                      |
|    normal     | Shift + << | indent line to the left                       |
|    normal     | Shift + Y  | yank to the end of line                       |
|    normal     |   Y + p    | Duplicate line (Sublime like Ctrl+d)          |
|    normal     |  Ctrl + b  | toggle NERDTree                               |
|    normal     | comma + t  | open NERDTree based on current file           |
|    normal     | comma + e  | show list error (syntastic checker)           |
|    normal     | comma + p  | find file (fzf)                               |
|    normal     | comma + f  | fastest `grep`                                |
|    normal     |  Ctrl + t  | run :ALEDetail                                |
|    normal     | comma + k  | ale previous wrap                             |
|    normal     | comma + j  | ale next wrap                                 |
|    insert     | tab        | navigate the completion (down)                |
|    insert     | shift + tab| navigate the completion (up)                  |
