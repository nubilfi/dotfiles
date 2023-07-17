require("packer-config")
require("options")

if vim.g.vscode then
    -- VSCode extension
	require("vim-easymotion")
else
    -- ordinary Neovim
	require("autopairs-config")
	require("filetype-config")
	--require("bufferline-config")
	require("comment-nvim-config")
	require("fidget-config")
	require("gitsigns-config")
	require("mason-config")
	require("keymap-config")
	require("lualine-config")
	require("lsp-config.lsp")
	require("lsp-config.completion")
	require("lsp-config.null-ls")
	require("nvim-tree-config")
	require("rust-tools-config")
	require("telescope-config")
	require("treesitter-config")
end
