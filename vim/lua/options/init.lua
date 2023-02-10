local set = vim.opt

set.autoread = true -- Set to auto read when a file is changed from the outside
set.backspace = "indent,eol,start" -- more powerful backspacing
--set.breakindent = true
--set.cursorline = true
set.clipboard = "unnamed" -- access your system clipboard
--set.conceallevel = 0 -- See `` in markdown files
set.conceallevel = 2
set.completeopt = "menuone,noinsert,noselect"
set.encoding = "utf8" -- change the output encoding that is shown in the terminal. 
set.expandtab = true -- convert tabs into spaces
set.fileencoding = "utf-8" -- change the output encoding of the file that is written.
--set.fillchars = "eob: "
set.ffs = "unix,dos,mac" -- Use Unix as the standard file type
set.foldmethod = "expr" -- Code folding
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldlevel = 99
set.hidden = true
set.history = 500 -- Sets how many lines of history VIM has to remember
set.hlsearch = true
set.incsearch = true -- incremental search
set.ignorecase = true
set.laststatus = 2 -- Always show the status line
set.linespace = 15
set.list = true --  Show trailing white space
set.listchars = "tab:>·,trail:~,extends:>,precedes:<,space:.,eol:↴" -- eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
-- set.mouse = "nicr"
--set.mouse = "a"
set.magic = true -- For regular expressions turn magic on
--BROKEN set.nocompatible = true -- enter the current millenium
set.number = true -- always show line numbers
set.ruler = true -- Always show current position
--set.relativenumber = true
set.scrolloff = 3 -- when scrolling, keep cursor 3 lines away from screen border
set.shiftwidth = 2 -- amount of block indenting
set.smarttab = true -- uses the shiftwidth instead of tabstop to delete indented line
set.showmode = false
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.synmaxcol = 200  -- performance ???
set.tabstop = 2 -- press tab, 2 spaces forward, 1 tab == 2 spaces
set.termguicolors = true
set.timeoutlen = 500 -- Default timeoutlen is 1000 ms
set.updatetime = 300 -- Faster completion
set.wrap = true
set.wildmenu = true
set.wildignore = "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/target/*,*/node_modules/*" -- ignored
set.wildmode = "list:longest" -- autocompletion of files and commands behaves like shell
-- set.background = "dark"

vim.cmd("colorscheme PaperColor")

if not os.getenv("TMUX") then
  local Normal = vim.api.nvim_get_hl_by_name("Normal", true)
  local bg = string.format("#%06x", Normal["background"])

  os.execute('printf "\\033]11;' .. bg .. '\\007"')
end

vim.notify = require("notify")

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append("c")