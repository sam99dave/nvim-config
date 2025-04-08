-- use this post lsp.lua

return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- python
            dap.adapters.python = {
                type = "executable",
                -- command = vim.fn.exepath("python3"),
                command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
                -- command = "python3",
                args = {"-m", "debugpy.adapter"},
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return vim.fn.exepath("python3")
                    end,
                },
            }

            -- go
            -- Ignore the warning as the daignostic assumes that function form is being used
            dap.adapters.go = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "dlv",
                    args = { "dap", "-l", "127.0.0.1:", "${port}" },
                },
            }
            -- dap.adapters.go = function(callback, config)
            --   callback({
            --     type = "server",
            --     port = "${port}",
            --     executable = {
            --       command = "dlv",
            --       args = { "dap", "-l", "127.0.0.1:", "${port}" },
            --     },
            --   })
            -- end

            dap.configurations.go = {
                {
                    type = "go",
                    name = "Debug",
                    request = "launch",
                    program = "${file}",
                },
            }

            -- (Optional) Keybindings
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
            vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

        end,

    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {"debugpy", "delve"},
                automatic_installation = true,
            })
        end,
    },

    -- DAP UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.evebt_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    }
}
