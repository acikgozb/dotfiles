return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("noirbuddy.colors").all()

		local theme = {
			normal = {
				a = { bg = colors.primary, fg = colors.black, gui = "bold" },
				b = { bg = colors.background, fg = colors.white },
				c = { bg = colors.background },
			},
			visual = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = colors.background, fg = colors.white },
				c = { bg = colors.background },
			},
			insert = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = colors.background, fg = colors.white },
				c = { bg = colors.background },
			},
			command = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = colors.background, fg = colors.white },
				c = { bg = colors.background },
			},
			inactive = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = colors.background, fg = colors.white },
				c = { bg = colors.background },
			},
			replace = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = colors.background, fg = colors.white },
				c = { bg = colors.background },
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
