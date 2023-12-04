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
map('n', ',Y', '"+y', opts) -- Copy to clipboard
map('n', ',P', '"+p', opts) -- paste from clipboard
map("n", "Y", "y$", opts) -- yank from the cursor to the end of the line
map("n", ";", ":", { noremap = true }) -- enter command mode
map("n", "\\", ":noh<return>", opts) -- clear the search

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

--> neo-tree mappings <--
map("n", "<C-z>", ":Neotree toggle<CR>", opts)
map("n", "<leader>o", [[<Cmd>lua if vim.bo.filetype == "neotree" then vim.cmd('wincmd p') else vim.cmd('Neotree focus') end<CR>]], opts)

--> telescope mappings <--
map("n", "<leader>ff", ":Telescope find_files hidden=true<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)

--> spectre mappings <--
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
