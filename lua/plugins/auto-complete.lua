return {
    -- Auto complete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for completion
            "hrsh7th/cmp-buffer", -- Buffer source for completion 
            "hrsh7th/cmp-path", -- Path completion
            "saadparwaiz1/cmp_luasnip", -- Snippet completion source
            "L3MON4D3/LuaSnip", -- Snippet engine
            "rafamadriz/friendly-snippets", -- Optional: Community snippets

        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    ["<Tab>"] = cmp.mapping.select_next_item(), -- Use Tab to select the next suggestion
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Use Shift+Tab to select the previous suggestion
                },
                sources = {
                    { name = "nvim_lsp" }, -- Use LSP source
                    { name = "buffer" }, -- Use buffer source
                    { name = "path" }, -- Use path source
                    { name = "luasnip" }, -- Use snippet source
                },
            })
        end,
    },
    -- Auto Pairs for opening closing charachters.
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
}
