vim.api.nvim_create_autocmd({ "LspAttach" }, {
	desc = "Start null-ls when starting a lsp client",
	callback = function()
	  pcall(function() require("null-ls").enable({}) end)
	end
})

vim.g["lsp-timeout-config"] = {
	-- 5 minutes
	stopTimeout  = 1000 * 60 * 5,  -- ms, timeout before stopping all LSP servers
	startTimeout = 1000 * 5,      -- ms, timeout before restart
	silent       = true           -- true to suppress notifications
}