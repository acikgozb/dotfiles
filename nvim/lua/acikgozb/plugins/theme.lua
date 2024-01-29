return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavour = "mocha",
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			integations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
	-- "rose-pine/neovim",
	-- name = "rose-pine",
	-- config = function()
	-- 	vim.cmd("colorscheme rose-pine")
	-- end,
	-- "loctvl842/monokai-pro.nvim",
	-- config = function()
	-- 	require("monokai-pro").setup({
	-- 		transparent_background = false,
	-- 		terminal_colors = true,
	-- 		styles = {
	-- 			comment = { italic = true },
	-- 			keyword = { italic = true }, -- any other keyword
	-- 			type = { italic = true }, -- (preferred) int, long, char, etc
	-- 			storageclass = { italic = true }, -- static, register, volatile, etc
	-- 			structure = { italic = true }, -- struct, union, enum, etc
	-- 			parameter = { italic = true }, -- parameter pass in function
	-- 			annotation = { italic = true },
	-- 		},
	-- 		filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
	-- 		-- Enable this will disable filter option
	-- 		day_night = {
	-- 			enable = false, -- turn off by default
	-- 			day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
	-- 			night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
	-- 		},
	-- 		inc_search = "background", -- underline | background
	-- 		background_clear = {
	-- 			"toggleterm",
	-- 			"telescope",
	-- 			"renamer",
	-- 			"notify",
	-- 		},
	-- 		plugins = {
	-- 			bufferline = {
	-- 				underline_selected = false,
	-- 				underline_visible = false,
	-- 			},
	-- 			indent_blankline = {
	-- 				context_highlight = "default", -- default | pro
	-- 				context_start_underline = false,
	-- 			},
	-- 		},
	-- 		override = function(c) end,
	-- 	})
	-- 	vim.cmd([[colorscheme monokai-pro]])
	-- end,
	priority = 1000, --load this plugin in a higher priority
}
