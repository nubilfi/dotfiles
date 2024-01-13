local api = vim.api

-- api.nvim_create_autocmd("ColorScheme", {
--   group = api.nvim_create_augroup("settermbg", {}),
--   callback = function(_)
--     local bg = api.nvim_get_hl(0, { name = "Normal", link = false }).bg
--     if not bg then
--       return
--     end

--     if os.getenv("TMUX") then
--       bg = string.format('printf "\\ePtmux;\\e\\033]11;#%06x\\007\\e\\\\"', bg)
--     else
--       bg = string.format('printf "\\033]11;#%06x\\007"', bg)
--     end

--     os.execute(bg)

--     vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
--   end,
-- })

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