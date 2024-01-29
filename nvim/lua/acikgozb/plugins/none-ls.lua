return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatOnSaveGroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = formatOnSaveGroup,
						buffer = bufnr,
					})

					vim.api.nvim_create_autocmd("BufWritePre", {
						group = formatOnSaveGroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, {})
	end,
}
