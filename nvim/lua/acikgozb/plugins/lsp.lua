local M = {}

local show_lsp_document_symbols = function(builtin)
	return function()
		local opts = {
			show_line = true,
		}

		builtin.lsp_document_symbols(opts)
	end
end

function M.init()
	M.lsps = {
		"rust_analyzer",
		"gopls",
		"terraformls",
		"yamlls",
		"ansiblels",
		"ts_ls",
		"bashls",
		"lua_ls",
		"docker_compose_language_service",
		"dockerls",
		"jsonls",
		"marksman",
	}

	local util = require("lspconfig/util")
	M.lsp_settings = {
		["rust_analyzer"] = {
			filetypes = { "rust" },
		},
		["gopls"] = {
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
		},
		["ts_ls"] = {
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
		},
		["terraformls"] = {
			experimentalFeatures = {
				validateOnSave = true,
				prefillRequiredFields = true,
			},
			ignoreSingleFileWarning = true,
		},
		["yamlls"] = {
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
		},
		["ansiblels"] = {
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
		},
	}

	M.customize_windows()

	M.default_lsp_settings = M.setup_lsps()
end

function M.customize_windows()
	local colors = require("noirbuddy.colors").all()
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.primary })

	-- Set borders for diagnostic popups
	vim.diagnostic.config({
		float = { border = "rounded" },
	})

	-- Set borders for hover popups
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

function M.setup_lsps()
	local lspconfig = require("lspconfig")
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

	local default_lsp_settings = {
		capabilities = capabilities,
		on_attach = onAttach,
	}

	for _, lsp in ipairs(M.lsps) do
		local setup = default_lsp_settings
		local custom_settings = M.lsp_settings[lsp]
		if custom_settings ~= nil then
			setup = vim.tbl_deep_extend("force", setup, custom_settings)
		end

		lspconfig[lsp].setup(setup)
	end

	-- The default LSP settings are exported for LSP'
	-- which are not supported/installed via Mason.
	return default_lsp_settings
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
			M.init()

			local csharpLsp = require("roslyn")

			local csharp_settings = vim.tbl_deep_extend("force", {
				dotnet_cmd = "dotnet",
				roslyn_version = "4.9.0-3.23604.10",
			}, M.default_lsp_settings)
			csharpLsp.setup(csharp_settings)

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
