return {
    {
        "rcarriga/nvim-dap-ui",
        enabled = false,
        lazy = true,
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        enabled = false,
        lazy = true,
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        ft = "python",
        config = function(_, opts)
            require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
            vim.keymap.set('n', '<Leader>dpr', function() require('dap-python').test_method() end)
        end
    }
}
