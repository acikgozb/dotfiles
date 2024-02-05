return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- config = function()
	-- 	local catppuccin = require("catppuccin")
	--
	-- 	catppuccin.setup({
	-- 		flavour = "mocha",
	-- 		no_italic = false,
	-- 		no_bold = false,
	-- 		no_underline = false,
	-- 		styles = {
	-- 			comments = { "italic" },
	-- 			conditionals = { "italic" },
	-- 			loops = {},
	-- 			functions = {},
	-- 			keywords = {},
	-- 			strings = {},
	-- 			variables = {},
	-- 			numbers = {},
	-- 			booleans = {},
	-- 			properties = {},
	-- 			types = {},
	-- 			operators = {},
	-- 		},
	-- 		integations = {
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			treesitter = true,
	-- 		},
	-- 	})
	--
	-- vim.cmd.colorscheme("catppuccin")
	-- end,
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",
				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",
				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
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
	-- "projekt0n/caret.nvim",
	-- config = function()
	-- 	require("caret").setup({
	-- 		options = {
	-- 			transparent = false,
	-- 			inverted_signs = false,
	-- 			styles = {
	-- 				bold = true,
	-- 				italic = true,
	-- 				strikethrough = true,
	-- 				undercurl = true,
	-- 				underline = true,
	-- 			},
	-- 			inverse = {
	-- 				match_paren = false,
	-- 				visual = false,
	-- 				search = false,
	-- 			},
	-- 		},
	-- 		mapping = {
	-- 			toggle_bg = nil,
	-- 		},
	-- 		groups = {},
	-- 	})
	--
	-- 	vim.opt.background = "dark"
	-- 	vim.cmd("colorscheme caret")
	-- end,
	priority = 1000, --load this plugin in a higher priority
}
