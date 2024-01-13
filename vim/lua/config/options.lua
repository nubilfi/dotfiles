vim.g.mapleader = "," -- leader key
vim.g.maplocalleader = "," -- leader key

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt

-- Tab / Indentation
set.tabstop = 2
set.shiftwidth = 2 -- amount of block indenting
set.softtabstop = 2
set.expandtab = true -- convert tabs into spaces
set.smartindent = true
set.wrap = true

-- Search
set.incsearch = true -- incremental search
set.ignorecase = true
set.smartcase = true
set.hlsearch = false

-- Appearance
set.background = "dark"
set.number = true -- always show line numbers
set.relativenumber = true -- always show line numbers
set.termguicolors = true
-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
set.signcolumn = "yes"
set.cmdheight = 1
set.scrolloff = 3 -- when scrolling, keep cursor 3 lines away from screen border
set.completeopt = "menuone,noinsert,noselect"

-- Behaviour
set.hidden = true
set.errorbells = false
set.swapfile = false
set.backup = false
set.backspace = "indent,eol,start" -- more powerful backspacing
set.splitright = true
set.splitbelow = true
set.autochdir = false
set.iskeyword:append("-")
set.mouse:append("a")
set.clipboard:append("unnamedplus")
set.modifiable = true
set.encoding = "UTF-8" -- change the output encoding that is shown in the terminal. 
set.fileencoding = "UTF-8" -- change the output encoding of the file that is written.
set.showmode = false
set.autoread = true -- Set to auto read when a file is changed from the outside
set.ruler = true -- Always show current position
set.shortmess:append("c") -- Avoid showing extra messages when using completion
set.wildignore = "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/target/*,*/node_modules/*" -- ignored
set.ffs = "unix,dos" -- Use Unix as the standard file type
set.magic = true -- For regular expressions turn magic on
set.linespace = 15
set.conceallevel = 2