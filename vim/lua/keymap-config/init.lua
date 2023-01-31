local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--> basic mappings <--
vim.g.mapleader = "," -- leader key
vim.g.maplocalleader = "," -- leader key

map("n", "<leader>", "z", opts) -- folding
map("n", "<leader>ss", ":w<cr>", opts) -- comma+ss to save
map("n", "<leader>q", ":q!<cr>", opts) -- comma+q to quit (does not save, watch out!)
map("n", "<leader>qa", ":qa!<cr>", opts) -- quit all without saving
map("n", "<leader>N", ":setlocal number!<cr>", opts) -- Toggle line numbers
map("n", "<Leader>Y", "+y", opts) -- Copy to clipboard
map("n", "<Leader>P", "+p", opts) -- paste from clipboard
map("n", "Y", "y$", opts) -- yank from the cursor to the end of the line
map("n", ";", ":", { noremap = true }) -- enter command mode

map("n", "<leader>lt", ":colorscheme PaperColor<cr>", opts) -- change colorscheme for daylight
map("n", "<leader>dt", ":colorscheme allomancer<cr>", opts) -- change colorscheme for night

map("i", "<leader>q", "<Esc>", opts) -- change escape key behaviour
map("i", "jj", "<Esc>", opts) -- change escape key behaviour

map("v", "<", "<gv", opts) -- indent to the left: Shift + <
map("v", ">", ">gv", opts) -- indent to the right: Shift + >

 --> navigate split screens easily <--
map("n", "<c-k>", ":wincmd k<CR>", { silent = true })
map("n", "<c-j>", ":wincmd j<CR>", { silent = true })
map("n", "<c-h>", ":wincmd h<CR>", { silent = true })
map("n", "<c-l>", ":wincmd l<CR>", { silent = true })

--> Open splits <--
map("n", "vs", ":vsplit<cr>", opts)
map("n", "sp", ":split<cr>", opts)

--> buffer key mappings <--
map("n", "<leader>l", ":bn<cr>", opts)
map("n", "<leader>h", ":bp<cr>", opts)
map("n", "<leader>0", ":bf<cr>", opts)
map("n", "<leader>9", ":bl<cr>", opts)
map("n", "<leader>dd", ":bd<cr>", opts)

--> managing tabs mappings <--
map("n", "tn", ":tabnew<Space>", opts)
map("n", "tk", ":tabnext<CR>", opts)
map("n", "tj", ":tabprev<CR>", opts)
map("n", "th", ":tabfirst<CR>", opts)
map("n", "tl", ":tablast<CR>", opts)
map("n", "tc", ":tabclose<CR>", opts)

--> nvim tree mappings <--
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gn", ":NvimTreeFocus<CR>", opts)
map("n", "<leader>t", ":NvimTreeFindFile<CR>", opts)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

--> telescope mappings <--
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)

--> barbar mappings <--
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", ":BufferMoveNext<CR>", opts)
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<C-p>", ":BufferPick<CR>", opts)
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)