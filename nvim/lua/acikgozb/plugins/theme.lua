return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- config = function()
	-- 	local catppuccin = require("catppuccin")
	--
	-- 	catppuccin.setup({
	-- 		flavour = "mocha",
	-- 	})
	--
	-- 	vim.cmd.colorscheme("catppuccin")
	-- end,
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end,
	priority = 1000, --load this plugin in a higher priority
}
