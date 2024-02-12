return {
	"aaronhallaert/advanced-git-search.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"tpope/vim-fugitive",
		"ibhagwan/fzf-lua",
	},
	config = function()
		require("advanced_git_search.fzf").setup()
	end,
}
