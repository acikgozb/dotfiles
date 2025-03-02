return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dap_virtual_text = require("nvim-dap-virtual-text")
		local dap_go = require("dap-go")

		dap_virtual_text.setup({
			virt_text_pos = "eol",
		})

		dap_go.setup()

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dta", dap.clear_breakpoints, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>de", dap.terminate, {})
		vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
		vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
		vim.keymap.set("n", "<Leader>dse", dap.step_out, {})
		vim.keymap.set("n", "<Leader>dgl", dap.goto_, {}) -- Let the debugger jump to the line under the cursor.
		vim.keymap.set("n", "<Leader>drt", dap.repl.toggle, {})
		vim.keymap.set("n", "<Leader>dgt", dap_go.debug_test, {})
		vim.keymap.set("n", "<Leader>duw", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, {})
		vim.keymap.set("n", "<Leader>duh", require("dap.ui.widgets").hover, {})
		vim.keymap.set("n", "<Leader>dgt", dap_go.debug_test, {})
	end,
}
