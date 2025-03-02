return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("noirbuddy.colors").all()

		local theme = {
			normal = {
				a = { bg = colors.primary, fg = colors.black, gui = "bold" },
				b = { bg = nil, fg = colors.white },
				c = { bg = nil },
			},
			visual = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = nil, fg = colors.white },
				c = { bg = nil },
			},
			insert = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = nil, fg = colors.white },
				c = { bg = nil },
			},
			command = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = nil, fg = colors.white },
				c = { bg = nil },
			},
			inactive = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = nil, fg = colors.white },
				c = { bg = nil },
			},
			replace = {
				a = { bg = colors.background, fg = colors.primary, gui = "bold" },
				b = { bg = nil, fg = colors.white },
				c = { bg = nil },
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
				lualine_b = { { "filename", path = 1 } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "encoding", "filetype" },
				lualine_z = { "branch" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { { "filename", path = 1 } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "branch" },
			},
		})
	end,
}
