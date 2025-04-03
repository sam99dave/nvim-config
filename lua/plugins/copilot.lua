return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = {"markdown", "codecompanion"}
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
            })
        end,
    },
    {
        "olimorris/codecompanion.nvim",
        config = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opt = {
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot",{
                        schema = {
                            model = {
                                default = "claude-3.7-sonnet",
                            },
                        },
                        --env = {
                        --    api_key = "",
                        --}
                    })
                end,
            }
        }
    },
}
