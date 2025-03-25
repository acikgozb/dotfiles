local configure_terraform_highlights = function(colors)
	vim.api.nvim_set_hl(0, "TFResourceIdentifier", { bold = true, fg = colors.primary, italic = true })
	vim.api.nvim_set_hl(0, "@lsp.type.enumMember.terraform", { link = "TFResourceIdentifier" })
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"c_sharp",
				"lua",
				"vim",
				"javascript",
				"typescript",
				"go",
				"gowork",
				"gosum",
				"gomod",
				"json",
				"make",
				"rust",
				"proto",
				"sql",
				"vimdoc",
				"yaml",
				"html",
				"markdown",
				"bash",
				"ruby",
				"terraform",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		-- Language specific syntax highlighting
		local colors = require("noirbuddy.colors").all()
		configure_terraform_highlights(colors)
	end,
}
