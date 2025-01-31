local show_lsp_document_symbols = function(builtin)
	return function()
		local opts = {
			show_line = true,
		}

		builtin.lsp_document_symbols(opts)
	end
end

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
					"rust_analyzer",
					"lua_ls",
					"ts_ls",
					"hydra_lsp",
					"marksman",
					"html",
					"dockerls",
					"docker_compose_language_service",
					"bashls",
					"yamlls",
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
			local builtin = require("telescope.builtin")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local onAttach = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gR", builtin.lsp_references, opts)

				vim.keymap.set("n", "gD", builtin.lsp_definitions, opts)
				vim.keymap.set("n", "gI", builtin.lsp_implementations, opts)
				vim.keymap.set("n", "gS", show_lsp_document_symbols(builtin), opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = onAttach,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = onAttach,
				filetypes = { "rust" },
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

			lspconfig.ts_ls.setup({
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
					javascript = {
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

			lspconfig.bashls.setup({
				capabilities = capabilities,
				on_attach = onAttach,
			})

			lspconfig.terraformls.setup({
				capabilities = capabilities,
				on_attach = onAttach,
				experimentalFeatures = {
					validateOnSave = true,
					prefillRequiredFields = true,
				},
				ignoreSingleFileWarning = true,
			})

			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
				on_attach = onAttach,
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
				on_attach = onAttach,
			})

			lspconfig.yamlls.setup({
				on_attach = onAttach,
				capabilities = capabilities,
				settings = {
					yaml = {
						completion = true,
						validate = true,
						hover = true,
						format = {
							enable = true,
							bracketSpacing = true,
						},
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						-- schemas = {
						-- 	["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						-- },
					},
				},
			})

			lspconfig.jsonls.setup({
				on_attach = onAttach,
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
				on_attach = onAttach,
				capabilities = capabilities,
			})

			csharpLsp.setup({
				dotnet_cmd = "dotnet",
				roslyn_version = "4.9.0-3.23604.10",
				capabilities = capabilities,
				on_attach = onAttach,
			})

			lspconfig.ansiblels.setup({
				on_attach = onAttach,
				capabilities = capabilities,
				settings = {
					ansible = {
						ansible = {
							useFullyQualifiedCollectionNames = true,
						},
						ansibleLint = {
							enabled = true,
						},
					},
				},
			})

			vim.filetype.add({
				pattern = {
					-- Ansible file patterns, additional file patterns may be needed, based on the usage.
					["requirements.ya?ml"] = "yaml.ansible",
					["inventory.ya?ml"] = "yaml.ansible",
					[".*/playbook.ya?ml"] = "yaml.ansible",
					[".*/defaults/*.ya?ml"] = "yaml.ansible",
					[".*/vars/*.ya?ml"] = "yaml.ansible",
					[".*/tasks/*.ya?ml"] = "yaml.ansible",
					[".*/local.ya?ml"] = "yaml.ansible",
				},
			})
		end,
	},
}
