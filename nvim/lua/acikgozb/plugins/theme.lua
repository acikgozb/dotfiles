return {
	"jesseleite/nvim-noirbuddy",
	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},
	lazy = false,
	priority = 1000,
	opts = {
		presets = "minimal",
	},
	-- "aliqyan-21/darkvoid.nvim",
	-- config = function()
	-- 	require("darkvoid").setup({
	-- 		transparent = false,
	-- 		glow = false,
	-- 		show_end_of_buffer = true,
	-- 		colors = {
	-- 			fg = "#c0c0c0",
	-- 			bg = "#1c1c1c",
	-- 			cursor = "#bdfe58",
	-- 			line_nr = "#404040",
	-- 			visual = "#444444",
	-- 			comment = "#585858",
	-- 			string = "#d1d1d1",
	-- 			func = "#e1e1e1",
	-- 			kw = "#f1f1f1",
	-- 			identifier = "#b1b1b1",
	-- 			type = "#a1a1a1",
	-- 			type_builtin = "#c5c5c5",
	-- 			search_highlight = "#1bfd9c",
	-- 			operator = "#1bfd9c",
	-- 			bracket = "#e6e6e6",
	-- 			preprocessor = "#4b8902",
	-- 			bool = "#66b2b2",
	-- 			constant = "#b2d8d8",
	--
	-- 			plugins = {
	-- 				gitsigns = true,
	-- 				nvim_cmp = true,
	-- 				treesitter = true,
	-- 				telescope = true,
	-- 				lualine = false,
	-- 			},
	--
	-- 			-- gitsigns colors
	-- 			added = "#baffc9",
	-- 			changed = "#ffffba",
	-- 			removed = "#ffb3ba",
	--
	-- 			-- EndOfBuffer color
	-- 			eob = "#3c3c3c",
	--
	-- 			-- Telescope specific colors
	-- 			border = "#585858",
	-- 			title = "#bdfe58",
	--
	-- 			-- LSP diagnostics colors
	-- 			error = "#dea6a0",
	-- 			warning = "#d6efd8",
	-- 			hint = "#bedc74",
	-- 			info = "#7fa1c3",
	-- 		},
	-- 	})
	--
	-- 	vim.cmd("colorscheme darkvoid")
	-- end,
}
