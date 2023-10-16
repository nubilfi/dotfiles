-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt

set.autoread = true -- Set to auto read when a file is changed from the outside
set.backspace = "indent,eol,start" -- more powerful backspacing
set.conceallevel = 2
set.completeopt = "menuone,noinsert,noselect"
set.encoding = "utf8" -- change the output encoding that is shown in the terminal. 
set.expandtab = true -- convert tabs into spaces
set.fileencoding = "utf-8" -- change the output encoding of the file that is written.
set.ffs = "unix,dos,mac" -- Use Unix as the standard file type
set.foldmethod = "expr" -- Code folding #this
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldlevel = 99
set.hlsearch = true
set.incsearch = true -- incremental search
set.ignorecase = true
set.linespace = 15
set.list = true --  Show trailing white space #this
set.listchars = "tab:>·,trail:~,extends:>,precedes:<,space:." -- eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set.magic = true -- For regular expressions turn magic on
set.number = true -- always show line numbers
set.relativenumber = true -- always show line numbers
set.ruler = true -- Always show current position
set.scrolloff = 3 -- when scrolling, keep cursor 3 lines away from screen border
set.shiftwidth = 2 -- amount of block indenting
set.showmode = false
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.wildignore = "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/target/*,*/node_modules/*" -- ignored
set.background = "dark"

vim.cmd("colorscheme sonokai")

-- Fix broken padding Terminator
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

vim.opt.clipboard:append('unnamedplus')
