local api = vim.api

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  {
    pattern = { "*.txt", "*.md" },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = "en,id"
    end,
  }
)

-- close some filetypes with <q>
api.nvim_create_autocmd("FileType", {
  group = api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- auto close brackets
-- this
-- api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- resize neovim split when terminal is resized
api.nvim_command("autocmd VimResized * wincmd =")

-- don't auto comment new line
-- api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
