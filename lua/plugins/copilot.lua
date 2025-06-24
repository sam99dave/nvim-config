return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = {"markdown", "codecompanion"}
    },
    --{
    --    "zbirenbaum/copilot.lua",
    --    cmd = "Copilot",
    --    event = "InsertEnter",
    --    config = function()
    --        require("copilot").setup({
    --            suggestion = {
    --                enabled = true,
    --                auto_trigger = true,
    --                hide_during_completion = true,
    --                debounce = 75,
    --                keymap = {
    --                    accept = "<M-l>",
    --                    accept_word = false,
    --                    accept_line = false,
    --                    next = "<M-]>",
    --                    prev = "<M-[>",
    --                    dismiss = "<C-]>",
    --                },
    --            },
    --        })
    --    end,
    --},
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
          },
          ignore_filetypes = { cpp = true }, -- or { "cpp", }
          color = {
            suggestion_color = "#12CAD6", --#ffffff",
            cterm = 244,
          },
          log_level = "info", -- set to "off" to disable logging completely
          disable_inline_completion = false, -- disables inline completion for use with cmp
          disable_keymaps = false, -- disables built in keymaps for more manual control
          condition = function()
            return false
          end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
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
