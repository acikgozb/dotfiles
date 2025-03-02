local M = {}

function M.init(builtin, actions, actions_state)
    M.builtin = builtin
    M.actions = actions
    M.actions_state = actions_state

    M.find_files = function()
        builtin.find_files({
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        })
    end

    M.find_oldfiles = builtin.oldfiles
    M.find_string_under_cursor = builtin.grep_string
    M.find_string_in_buffer = builtin.current_buffer_fuzzy_find
    M.find_string_in_workspace = builtin.live_grep
end

M.open_in_vsplit = function()
    M.builtin.find_files({
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        attach_mappings = function(_, map)
            map({ "i", "n" }, "<CR>", M.actions.select_vertical)
            return true
        end,
    })
end

local set_highlight_groups = function()
    local colors = require("noirbuddy.colors").all()

    local telescope_highlight_groups = {
        TelescopeNormal = { fg = colors.secondary, bg = "NONE" },
        TelescopeBorder = { fg = colors.primary, bg = "NONE" },
        TelescopePromptNormal = { fg = colors.none, bg = "NONE" },
        TelescopePromptBorder = { fg = colors.primary, bg = "NONE" },
        TelescopePromptCounter = { fg = colors.white, bg = "NONE" },
        TelescopePromptTitle = { fg = colors.secondary, bg = "NONE", gui = "bold" },
        TelescopeSelectionCaret = { fg = colors.primary, bg = colors.background },
        TelescopeSelection = { fg = colors.secondary, bg = colors.background, gui = "bold" },
        TelescopeMatching = { fg = colors.primary, bg = "NONE", gui = "bold" },
    }

    for group_name, config in pairs(telescope_highlight_groups) do
        local cmd = "highlight " .. group_name
        if config.fg then
            cmd = cmd .. " guifg=" .. config.fg
        end
        if config.bg then
            cmd = cmd .. " guibg=" .. config.bg
        end
        if config.gui then
            cmd = cmd .. " gui=" .. config.gui
        end
        vim.cmd(cmd)
    end
end

return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-telescope/telescope-fzf-native.nvim" },
        config = function()
            local telescope = require("telescope")
            local telescope_builtin = require("telescope.builtin")
            local telescope_actions = require("telescope.actions")
            local telescope_actions_state = require("telescope.actions.state")

            M.init(telescope_builtin, telescope_actions, telescope_actions_state)

            vim.keymap.set("n", "<leader>ff", M.find_files, {})
            vim.keymap.set("n", "<leader>fo", M.find_oldfiles, {})
            vim.keymap.set("n", "<leader>fb/", M.find_string_in_buffer, {})
            vim.keymap.set({ "n", "v" }, "<leader>fs/", M.find_string_under_cursor, {})
            vim.keymap.set("n", "<leader>f/", M.find_string_in_workspace, {})
            vim.keymap.set("n", "<leader>fv", M.open_in_vsplit, {})

            set_highlight_groups()
            telescope.load_extension("fzf")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = { width = 0.99 },
                        vertical = { width = 0.99 },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
