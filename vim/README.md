# Nubilfi's dotfiles

### Vim 8+ as Python and Javascript IDE

I used Vundle as plugins manager, follow the instructions from the [Vundle](https://github.com/VundleVim/Vundle.vim) official documentation for setup and installation.

As an addition to this config (optional), please install these packages: `exuberant-ctags git ack-grep`. Find that packages name according to your Linux distro, it might be different for each distro.

The next step is to install the following dependencies: `pip install pep8 flake8 pyflakes isort yapf`, and don't forget to patch icon to be able to show the icon files, please follow [vim-devicons](https://github.com/ryanoasis/vim-devicons) instructions.

I'm using [coc.nvim](https://github.com/neoclide/coc.nvim) for `.vimrc-js` file, so please check on that link for more details about installation. And here are the list of `coc.nvim` extensions that i used:

- coc-tsserver
- coc-yank
- coc-styled-components
- coc-sql
- coc-snippets
- coc-python
- coc-pairs
- coc-markdownlint
- coc-json
- coc-import-cost
- coc-html
- coc-highlight
- coc-docker
- coc-css

Brief help:

- :PluginList - lists configured plugins
- :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
- :PluginSearch foo - searches for foo; append `!` to refresh local cache
- :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal

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
|    normal     | comma + ev | paste to clipboard                            |
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
| visual/normal | comma + 1  | insert "!" commenting                         |
| visual/normal | comma + '  | insert " commenting                           |
| visual/normal | comma + 3  | insert "#" commenting                         |
| visual/normal | comma + -  | insert "--" commenting                        |
| visual/normal | comma + 6  | uncomment                                     |
|    normal     |  Ctrl + b  | toggle NERDTree                               |
|    normal     | comma + t  | open NERDTree based on current file           |
|    normal     | comma + e  | show list error (syntastic checker)           |
|    normal     | comma + ee | find file (ctrlp)                             |
|    normal     | comma + g  | tags (symbols) in current file finder (ctrlp) |
|    normal     | comma + G  | tags (symbols) in all files finder (ctrlp)    |
|    normal     | comma + f  | general code finder in all files (ctrlp)      |
|    normal     | comma + m  | recent files finder (ctrlp)                   |
|    normal     | comma + c  | commands finder (ctrlp)                       |
|    normal     | comma + ms | show (minimap)                                |
|    normal     | comma + mu | update (minimap)                              |
|    normal     | comma + gc | close (minimap)                               |
|    normal     | comma + gt | toggle (minimap)                              |
|    normal     | comma + tl | toggle on tab (tabman)                        |
|    normal     | comma + tf | focus on tab (tabman)                         |
|    normal     |     -      | choose split windows buffer by letter         |
|    normal     |  Ctrl + E  | triggering emmet                              |
