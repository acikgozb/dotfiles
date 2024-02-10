return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"lua_ls",
					"tsserver",
					"hydra_lsp",
					"marksman",
					"html",
					"dockerls",
					"docker_compose_language_service",
					"bashls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = "jmederosalvarado/roslyn.nvim",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")
			local csharpLsp = require("roslyn")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local onAttach = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = onAttach,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = onAttach,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = onAttach,
				settings = {
					typescript = {
						format = {
							enable = true,
							insertSpaceAfterConstructor = true,
							semicolons = true,
						},
						inlayHints = {
							enumMemberValues = true,
							functionLikeReturnTypes = true,
							parameterNames = {
								enabled = "all",
								suppressWhenArgumentMatchesName = false,
							},
							parameterTypes = {
								enabled = true,
							},
						},
						suggest = {
							completeFunctionCalls = true,
						},
					},
				},
			})

			csharpLsp.setup({
				dotnet_cmd = "dotnet",
				roslyn_version = "4.9.0-3.23604.10",
				capabilities = capabilities,
				on_attach = onAttach,
			})

			-- vim.api.nvim_create_autocmd("LspAttach", {
			--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			--     callback = function(event)
			--         -- Enable completion triggered by <c-x><c-o>
			--         vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			--
			--         print("hello on attach")
			--         onAttach(event)
			--     end,
			-- })
		end,
	},
}
