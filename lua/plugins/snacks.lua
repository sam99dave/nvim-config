return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = { enabled = true }, -- Lazy Dashboard
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
    },
    keys = {
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "File Explorer",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers"
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
        -- Telescope related
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    layout_strategy = "bottom_pane",
                    layout_config = { height = 0.4 }
                })
            end,
            desc = "Find Files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep({
                    layout_strategy = "bottom_pane",
                    layout_config = { height = 0.4 }

                })
            end,
            desc = "Live Grep",
        },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },



    }
}

