return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local colors = {
			blue = "#66b2b2",
			black = "#1c1c1c",
			green = "#1bfd9c",
			gray = "#404040",
			white = "#d1d1d1",
		}

		local theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				b = { bg = colors.black, fg = colors.blue },
				c = { bg = colors.black },
			},
			visual = {
				a = { bg = colors.black, fg = colors.green, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black },
			},
			insert = {
				a = { bg = colors.black, fg = colors.green, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black },
			},
			command = {
				a = { bg = colors.black, fg = colors.green, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black },
			},
			inactive = {
				a = { bg = colors.black, fg = colors.green, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black },
			},
			replace = {
				a = { bg = colors.black, fg = colors.green, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black },
			},
		}

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "encoding", "filetype" },
				lualine_z = { "branch" },
			},
		})
	end,
}
