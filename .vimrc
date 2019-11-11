" BASIC SETUP:
" the <leader> is (comma)
" ***************************************************************************
" to be able to use VIM key combos not only in the shell but also in the Python interpreter
" and any other tool that uses GNU Readline, add the following line to ~/.inputrc
" set editing-mode vi
" ***************************************************************************

set autoread                                                                " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start                                              " more powerful backspacing
set clipboard=unnamed                                                       " access your system clipboard
set cmdheight=2                                                             " Height of the command bar
syntax enable                                                               " enable syntax highlighting and plugin (for netrw)
set encoding=utf8                                                           " Set utf8 as standard encoding and en_US as the standard language
set expandtab                                                               " convert tabs into spaces
set ffs=unix,dos,mac                                                        " Use Unix as the standard file type
set foldmethod=indent                                                       " Code folding
set foldlevel=99
set history=500                                                             " Sets how many lines of history VIM has to remember
set incsearch                                                               " incremental search
set laststatus=2                                                            " Always show the status line
set list                                                                    " Show trailing white space
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:.                   " eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set mouse=nicr
set magic                                                                   " For regular expressions turn magic on
set nocompatible                                                            " enter the current millenium
set number                                                                  " always show line numbers
set hidden
set ruler                                                                   " Always show current position
set scrolloff=3                                                             " when scrolling, keep cursor 3 lines away from screen border
set shiftwidth=2                                                            " amount of block indenting
set smarttab                                                                " uses the shiftwidth instead of tabstop to delete indented line
set synmaxcol=200                                                           " performance ???
set tabstop=2                                                               " press tab, 2 spaces forward, 1 tab == 2 spaces
set wrap                                                                    " Wrap lines

" PLUGINS
" ************************************************************************
" set the runtime path to include VUndle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

Plugin 'flazz/vim-colorschemes'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'airblade/vim-gitgutter'

" Icon files
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'arielrossanigo/dir-configs-override.vim'                            " Override configs by directory
Plugin 'scrooloose/nerdtree'                                                " Better file browser
Plugin 'scrooloose/nerdcommenter'                                           " Code commenter
Plugin 'majutsushi/tagbar'                                                  " Class/module browser
Plugin 'ctrlpvim/ctrlp.vim'                                               " Code and files fuzzy finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'                                       " Extension to ctrlp, for fuzzy command finder
Plugin 'mattn/emmet-vim'                                                    " Zen coding, use emmet
Plugin 'tpope/vim-fugitive'                                                 " Git integration
Plugin 'kien/tabman.vim'                                                    " Tab list panel
Plugin 'tpope/vim-surround'                                                 " Surround
Plugin 'Townk/vim-autoclose'                                                " Autoclose chars
Plugin 'jeetsukumaran/vim-indentwise'                                       " Indentation based movements
Plugin 'MarcWeber/vim-addon-mw-utils'                                       " Snippets manager (SnipMate), dependencies, and snippets repo
Plugin 'tomtom/tlib_vim'                                                    " Select item from list
Plugin 'honza/vim-snippets'                                                 " snippets files for various programming languages.
Plugin 'garbas/vim-snipmate'                                                " for textual snippets,
Plugin 'fisadev/dragvisuals.vim'                                            " Drag visual blocks arround (it is like Ctrl+d arrow up/down on sublime)
Plugin 't9md/vim-choosewin'                                                 " Land on window like tmux's 'display-pane'
Plugin 'scrooloose/syntastic'                                               " Languages code checker
Plugin 'ap/vim-css-color'                                                   " Paint css colors with the real color
Plugin 'mileszs/ack.vim'                                                    " Ack code search (requires ack installed in the system)
Plugin 'google/vim-searchindex'                                             " display number of search matches & index of a current match

" Plugins == FOR PYTHON ==
Plugin 'Chiel92/vim-autoformat'
Plugin 'michaeljsmith/vim-indent-object'                                    " Indent text object
Plugin 'Shougo/neocomplcache.vim'                                           " Better autocompletion
Plugin 'davidhalter/jedi-vim'                                               " Python autocompletion, go to definition.
Plugin 'fisadev/vim-isort'                                                  " Automatically sort python imports
if has('python')
    Plugin 'pignacio/vim-yapf-format'                                       " YAPF formatter for Python
endif

" Pluginins from vim-scripts repos:
Plugin 'vim-scripts/matchit.zip'                                             " XML/HTML tags navigation
Plugin 'vim-scripts/YankRing.vim'                                            " Yank history navigation

" theme plugins
Plugin 'nightsense/office'
Plugin 'fatih/molokai'
Plugin 'nightsense/cosmic_latte'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'Nequo/vim-allomancer'

" All of your Plugins must be added before the following line
call vundle#end()                                                           " required
filetype plugin indent on              " required

" OTHER BASIC SETUP (TWEAKS)
" ***************************************************************************
let mapleader = ","
let maplocalleader = ","
set termguicolors
nnoremap <leader>N :setlocal number!<cr>            " Toggle line numbers

" 1 comma+s to save
" 2 comma+q to quit (does not save, watch out!)
" 3 quit all without saving
nnoremap <leader>ss :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>qa :qa!<cr>

let $MYVIMRC="/home/bill/.vimrc"
" Reload vimrc
nnoremap <leader>rv :source<Space>$MYVIMRC<cr>
" Edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" Copy & paste to clipboard
noremap <Leader>Y "+y
noremap <Leader>P "+p

" change Escape key behaviour
" :imap ii <Esc>
imap <leader>q <Esc>
inoremap jj <Esc>

" Enable folding with the z
nnoremap <leader> z

" Buffer key mappings
nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>0 :bf<cr>
nnoremap <leader>9 :bl<cr>
nnoremap <leader>dd :bd<cr>

" tab length exceptions on some file types
" autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
" PEP 8 indentation for python (== FOR PYTHON ==)
au BufNewFile,BufRead *.py
            \ set tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ textwidth=79
            \ autoindent

" python with virtualenv support (== FOR PYTHON ==)
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    if project_base_dir:
        activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    if os.path.exists(activate_this):
        execfile(activate_this, dict(__file__=activate_this))
EOF

" Managing tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
" Pressing Shift-< or Shift-> will let you indent/unident selected lines,
" allow it to occur multiple times in visual mode
vnoremap < <gv
vnoremap > >gv

" Commenting
" comma-1 insert "!" commenting
nnoremap <leader>1 :norm i!<cr>
vnoremap <leader>1 :norm i!<cr>

" comma-' insert """ commenting
nnoremap <leader>' :norm i"<cr>
vnoremap <leader>' :norm i"<cr>

" comma-3 insert "#" commenting
nnoremap <leader>3 :norm i#<cr>
vnoremap <leader>3 :norm i#<cr>

" comma-- insert "--" commenting
nnoremap <leader>- :norm i--<cr>
vnoremap <leader>- :norm i--<cr>

" comma-6 uncomment
nnoremap <leader>6 :norm ^x<cr>
vnoremap <leader>6 :norm ^x<cr>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" FINDING FILES: **********************************************************
" search down into subfolders
" provides tab-completion for all file-related tasks
" set path+=**

" display all matching files when we tab complete
" set wildmenu
" set wildmode=list:longest,full
" set lazyredraw

" NOW WE CAN:
" - hit tab to :find by partial match
" - use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" END FINDING FILES: **********************************************************

" FILE BROWSING: *********************************************************
" tweaks for browsing
" let g:netrw_banner=0                                    " disable annoying banner
" let g:netrw_browse_split=4                              " open in prior window
" let g:netrw_altv=1                                      " open splits to the right
" let g:netrw_liststyle=3                                 " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" END FILE BROWSING: *********************************************************

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    " Choose colorscheme
    " *********************************************
    if strftime('%H') >= 7 && strftime('%H') < 20
        colorscheme sublimemonokai
    else
        " colorscheme office-dark
        colorscheme allomancer
        let g:airline_theme='cosmic_latte_dark'
    endif
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set cursorcolumn!

    " Set up the gui cursor to look nice
    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
endif

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" old autocomplete keyboard shortcut
" imap <C-J> <C-X><C-O>

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
" set completeopt-=preview

" TEMP simple recursive grep
" nmap <leader>r :Ack
" nmap <leader>wr :Ack <cword><CR>

" PLUGINS SETUP
" ********************************************************************************

" NERDTree -----------------------------
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'" Prettier
" open nerdtree with the current file selected
nmap <leader>t :NERDTreeFind<CR>
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMouseMode = 3
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore=['\.pyc$', '\~$']         "ignore files in NERDTree
"autocmd BufWinEnter * call timer_start(50, { tid -> execute('NERDTreeMirror')})    " open the new tab in NERDTree's buffer

" Tagbar -----------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" TEMP Signify -----------------------------
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
" let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
" nmap <leader>sn <plug>(signify-next-hunk)
" nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
" highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
" highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
" highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
" highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
" highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
" highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Syntastic -----------------------------
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_python_flake8_args='--ignore=E501,W504'

" tabular -----------------------------
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Jedi-vim (== FOR PYTHON ==) -----------------------------
" TEMP All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = '<leader>d'
" Find ocurrences
let g:jedi#usages_command = '<leader>o'
" Find assignments
let g:jedi#goto_assignments_command = '<leader>a'
" Go to definition in new tab
nmap <leader>D :tab split<CR>:call jedi#goto()<CR>

" Airline -----------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'distinguished'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}

" to use fancy symbols for airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" ctrlpvim -----------------------------
"nnoremap <leader>. :CtrlPTag<cr>                    " use Ctrlp to search for tags instead of files
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](node_modules|vendor)|\.(git|hg|svn)$',
"  \ 'file': '\v\.(sh|so)$',
"  \ }

" CtrlP -----------------------------
" file finder mapping
let g:ctrlp_map = '<leader>ee'
" tags (symbols) in current file finder mapping
nmap <leader>g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap <leader>G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap <leader>f :CtrlPLine<CR>
" recent files finder mapping
nmap <leader>m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap <leader>c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap <leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap <leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap <leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap <leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap <leader>wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|vendor)$',
            \ 'file': '\.pyc$\|\.pyo$\|\.sh$\|\.so$',
            \ }

" vim-minimap -----------------------------
let g:minimap_highlight='Visual'
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

" vim emmet trigger key, prest ctrl + e + comma -----------------------------
let g:user_emmet_leader_key='<C-E>'

" NeoComplCache (== FOR PYTHON ==) -----------------------------
" based on https://github.com/fisadev
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------
" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" choosewin  ------------------------------
" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" vim-autoformat --------------------------
let g:formatter_yapf_style = 'pep8'
"let g:autoformat_verbosemode=1
au BufWrite *.py :Autoformat

" isort -----------------------------------
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
