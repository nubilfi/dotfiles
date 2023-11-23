local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local gitsigns_actions = null_ls.builtins.code_actions.gitsigns

local sources = {
	--[[ formatting ]]
	-- formatting.eslint_d,
	-- formatting.stylelint, (for css etc.)
	formatting.stylua,
	--formatting.prettier, -- use it for json & markdown
	formatting.rustfmt.with({
	    extra_args = function(params)
	        local Path = require("plenary.path")
	        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

	        if cargo_toml:exists() and cargo_toml:is_file() then
	            for _, line in ipairs(cargo_toml:readlines()) do
	                local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
	                if edition then
	                    return { "--edition=" .. edition }
	                end
	            end
	        end
	        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
	        return { "--edition=2021" }
	    end,
	}),
	formatting.taplo,

	--[[ code actions ]]
	code_actions.ltrs,
	gitsigns_actions,

	--[[ diagnostics ]]
	diagnostics.ltrs,
}

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
