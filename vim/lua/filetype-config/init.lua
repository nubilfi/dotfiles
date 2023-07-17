vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.filetype.add({
			filename = {
				[".env"] = "sh",
				[".envrc"] = "sh",
				["*.env"] = "sh",
				["*.envrc"] = "sh"
			}
		})
	end,
})