local DirectedPane = function(opts)
	local win_key_sequence = { "k", "H" }

	if opts.win_key_sequence ~= nil then
		win_key_sequence = vim.tbl_deep_extend("force", win_key_sequence, opts.win_key_sequence)
	end

	vim.cmd(opts.command)

	local c_w = vim.api.nvim_replace_termcodes("<c-w>", true, false, true)

	for _, key in ipairs(win_key_sequence) do
		vim.api.nvim_feedkeys(c_w .. key, "n", true)
	end
end

local GitLogBranch = function()
	DirectedPane({
		command = ":Git log --graph --decorate",
	})
end

local GitLogAll = function()
	DirectedPane({
		command = ":Git log --graph --decorate --all",
	})
end

local GitLogSelection = function()
	local start_pos = vim.fn.getpos("v")[2]
	local end_pos = vim.fn.getpos(".")[2]
	local command = string.format(":Git log -L %s,%s:%s", start_pos, end_pos, vim.fn.expand("%"))

	DirectedPane({
		command = command,
	})
end

local GitStatus = function()
	DirectedPane({
		command = ":G",
	})
end

local GitMergetool = function()
	DirectedPane({
		command = ":Git mergetool",
		win_key_sequence = { "j", "H" },
	})
end

local GitBufferDiff = function()
	DirectedPane({
		command = ":Git diff %",
	})
end

local GitBlame = function()
	vim.cmd(":Git blame")
end

local GitResolveConflict = function()
	vim.cmd(":Gvdiffsplit!")
end

return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("v", "<leader>gl", GitLogSelection, { noremap = true })
			vim.keymap.set("n", "<leader>glb", GitLogBranch, { noremap = true })
			vim.keymap.set("n", "<leader>gla", GitLogAll, { noremap = true })
			vim.keymap.set("n", "<leader>gtb", GitBlame, { noremap = true })
			vim.keymap.set("n", "<leader>gs", GitStatus, { noremap = true })
			vim.keymap.set("n", "<leader>gmc", GitMergetool, { noremap = true })
			vim.keymap.set("n", "<leader>grc", GitResolveConflict, { noremap = true })
			vim.keymap.set("n", "<leader>gbd", GitBufferDiff, { noremap = true })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
					vim.keymap.set("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr })
				end,
			})
		end,
	},
}
