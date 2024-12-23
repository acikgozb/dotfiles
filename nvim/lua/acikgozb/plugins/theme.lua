return {
	"jesseleite/nvim-noirbuddy",
	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("noirbuddy").setup({
			preset = "oxide",
		})

		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
		vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
		vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
		vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
	end,
}
