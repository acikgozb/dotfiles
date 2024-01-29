return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go" },
	config = function()
		local dap = require("dap")
		local dap_ui = require("dapui")

		dap_ui.setup()
		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = function()
			dap_ui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dap_ui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dap_ui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dap_ui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>de", dap.terminate, {})
		vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
		vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
		vim.keymap.set("n", "<Leader>dse", dap.step_out, {})
	end,
}
