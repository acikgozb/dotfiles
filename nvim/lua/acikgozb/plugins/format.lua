return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "eslint_d", "prettier" } },
				typescript = { { "eslint_d", "prettier" } },
				json = { "fixjson", "jq" },
				html = { { "eslint_d", "prettier" } },
				markdown = { { "prettier" } },
				go = { "gofumpt", "goimports" },
				csharp = { "csharpier" },
				bash = { "beautysh" },
				yaml = { "yamlfmt" },
				["yaml.ansible"] = { "yamlfmt", "ansible-lint" },
				sql = { "sqlfmt" },
				tf = { "terraform_fmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
			formatters = {
				yamlfmt = {
					prepend_args = { "-conf", os.getenv("XDG_CONFIG_HOME") .. "/yamlfmt/.yamlfmt.yml" },
					inherit = true,
				},
			},
		})

		vim.keymap.set("n", "<Leader>gf", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 500,
			})
		end, {})
	end,
}
