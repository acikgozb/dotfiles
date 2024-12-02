return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				json = { "fixjson", "jq" },
				html = { "eslint_d" },
				markdown = { "prettier" },
				go = { "gofumpt", "goimports" },
				csharp = { "csharpier" },
				bash = { "beautysh" },
				yaml = { "yamlfmt" },
				sql = { "sqlfmt" },
				tf = { "terraform_fmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			-- Set the log level. Use `:ConformInfo` to see the location of the log file.
			log_level = vim.log.levels.ERROR,
			-- Conform will notify you when a formatter errors
			notify_on_error = true,
			-- Conform will notify you when no formatters are available for the buffer
			notify_no_formatters = true,
			-- Custom formatters and overrides for built-in formatters
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
