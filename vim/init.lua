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
	require("crates-config")
	require("comment-nvim-config")
	require("fidget-config")
	require("gitsigns-config")
	require("mason-config")
	require("keymap-config")
	require("lualine-config")
	require("lsp-config.lsp")
	require("lsp-config.completion")
	require("lsp-config.null-ls")
	require("nvim-spectre-config")
	require("nvim-neo-tree-config")
	require("rust-tools-config")
	require("telescope-config")
	require("treesitter-config")
end
