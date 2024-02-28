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
				"proto",
				"sql",
				"vimdoc",
				"yaml",
				"html",
				"json",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
