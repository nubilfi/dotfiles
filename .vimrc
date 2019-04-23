" BASIC SETUP:
" the <leader> is (comma)
" ***************************************************************************
filetype off

"set autoindent                                                              " copy indent from current line to new line
set autoread                                                                " Set to auto read when a file is changed from the outside
set cmdheight=2                                                             " Height of the command bar
syntax enable                                                               " enable syntax highlighting and plugin (for netrw)
set encoding=utf8                                                           " Set utf8 as standard encoding and en_US as the standard language
set expandtab                                                               " convert tabs into spaces
set ffs=unix,dos,mac                                                        " Use Unix as the standard file type
set foldmethod=indent                                                       " Code folding
set history=500                                                             " Sets how many lines of history VIM has to remember
set laststatus=2                                                            " Always show the status line
set list                                                                    " Show trailing white space
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:.                   " eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set mouse=nicr
set magic                                                                   " For regular expressions turn magic on
set nocompatible                                                            " enter the current millenium
set number                                                                  " always show line numbers
set nofoldenable
set hidden
"set paste                                                                   " disable auto index (not working because of auto-pairs plugin)
"set rnu                                                                     " relative numbers
set ruler                                                                   " Always show current position
set shiftwidth=2                                                            " amount of block indenting
"set softtabstop=2                                                           " backspace for converted tab
set smarttab                                                                " uses the shiftwidth instead of tabstop to delete indented line
"set smartindent                                                             " auto indenting when starting a new line
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

Plugin 'jiangmiao/auto-pairs'
Plugin 'w0rp/ale'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'yukpiz/vim-volt-syntax'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'flazz/vim-colorschemes'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'styled-components/vim-styled-components'
Plugin 'elzr/vim-json'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'sheerun/vim-polyglot'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'StanAngeloff/php.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-surround'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'Valloric/YouCompleteMe'

" theme plugins
Plugin 'BrainDeath0/Hypsteria'
Plugin 'nightsense/office'
Plugin 'fatih/molokai'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'nightsense/cosmic_latte'
Plugin 'Nequo/vim-allomancer'

" All of your Plugins must be added before the following line
call vundle#end()                                                           " required
syntax on
filetype plugin indent on              " required


" OTHER BASIC SETUP (TWEAKS)
" ***************************************************************************
let mapleader = ","
set termguicolors
nnoremap <leader>N :setlocal number!<cr>            " Toggle line numbers

" Search highlight
nnoremap <C-l> :nohlsearch<CR><C-l>
nnoremap <leader>i :set incsearch!<CR>
nnoremap <leader>ii :set hlsearch!<CR>
autocmd InsertEnter * call timer_start(50, { tid -> execute(':setlocal nohlsearch')})
autocmd InsertLeave * call timer_start(50, { tid -> execute(':setlocal hlsearch')})

" Copy & paste to clipboard
noremap <Leader>Y "+y
noremap <Leader>P "+p

" change Escape key behaviour
" :imap ii <Esc>
imap <leader>q <Esc>
inoremap jj <Esc>

" Buffer key mappings
nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>0 :bf<cr>
nnoremap <leader>9 :bl<cr>
nnoremap <leader>d :bd<cr>

" comma-s to save
nnoremap <leader>s :w<cr>

" comma-q to quit (doesn't save, watch out!)
nnoremap <leader>q :q!<cr>

" quit all without saving
nnoremap <leader>qa :qa!<cr>

let $MYVIMRC="/home/bill/.vimrc"

" Reload vimrc
nnoremap <leader>rv :source<Space>$MYVIMRC<cr>

" Edit vimrc
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

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

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Managing tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

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

" FINDING FILES: **********************************************************
" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full
set lazyredraw
set backspace=2

" NOW WE CAN:
" - hit tab to :find by partial match
" - use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" FILE BROWSING: *********************************************************
" tweaks for browsing
let g:netrw_banner=0                                    " disable annoying banner
let g:netrw_browse_split=4                              " open in prior window
let g:netrw_altv=1                                      " open splits to the right
let g:netrw_liststyle=3                                 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" BUILD INTEGRATION: ****************************************************
" configure the `make` command to run eslint or even run test
" set makeprg=npm\ run\ test\ (disabled)
set makeprg=./node_modules/.bin/eslint\ --no-color\ -f\ unix\ $*
set errorformat=%A%f:%l:%c:%m,%-G%.%#

" NOW WE CAN:
" - Run :make to run eslint test manually or to run unit test
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

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

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" PLUGINS SETUP
" ********************************************************************************

" NERDTree
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'" Prettier
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMouseMode = 3
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
autocmd BufWinEnter * call timer_start(50, { tid -> execute('NERDTreeMirror')})    " open the new tab in NERDTree's buffer

" vim-polyglot
let g:graphql_javascript_tags = ["graphql"]

" vim emmet trigger key, prest ctrl + e + comma
let g:user_emmet_leader_key='<C-E>'

" ctrlP
nnoremap <leader>. :CtrlPTag<cr>                    " use Ctrlp to search for tags instead of files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor)|\.(git|hg|svn)$',
  \ 'file': '\v\.(sh|so)$',
  \ }

" vim-minimap
let g:minimap_highlight='Visual'
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

" vim-javascript
" set conceallevel=1
map <leader>co :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Airline Themes
let g:airline_theme='distinguished'
"let g:airline_theme='badwolf'
"let g:airline_theme='term'

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'hbs' : 1,
    \ 'handlebars' : 1,
    \ 'ejs' : 1,
    \ 'jsx' : 1,
    \}

" Syntastic config do not set JS setup here
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_html_eslint_exec = 'eslint'

" ALE (eslint) to handle JS syntax
map <C-t> :ALEDetail<CR>
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_lint_on_enter = 0
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 960000                 " 16 minutes
let g:ale_lint_on_text_changed= "never"
let g:ale_list_window_size = 5                " Show 5 lines of errors (default: 10)
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
let g:ale_linters = {
  \  'sh': ['shell'],
  \  'javascript': ['eslint'],
  \}
let g:ale_fixers = {
  \  'sh': ['shfmt'],
  \  'javascript': ['prettier', 'eslint'],
  \  'json': ['prettier'],
  \  'markdown': ['prettier'],
  \  'yaml': ['prettier'],
  \  'css': ['prettier'],
  \}

" tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" vim jsx pretty
let g:vim_jsx_pretty_colorful_config = 1
