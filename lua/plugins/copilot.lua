return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = {"markdown", "codecompanion"}
    },
    {
        "github/copilot.vim"
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
                        env = {
                            api_key = "",
                        }
                    })
                end,
            }
        }
    },
}
