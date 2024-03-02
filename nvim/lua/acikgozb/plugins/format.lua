return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "eslint_d", "prettierd", "prettier" } },
				typescript = { { "eslint_d", "prettierd", "prettier" } },
				json = { { "eslint_d", "prettierd", "prettier" } },
				html = { { "eslint_d", "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				go = { "gofumpt", "goimports" },
				csharp = { "csharpier" },
				sh = { "beautysh" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set("n", "<Leader>gf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, {})
	end,
}
