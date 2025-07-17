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
            "onsails/lspkind.nvim",      -- Icons for completion
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                mapping = {
                    -- Just navigation with Tab/Shift-Tab
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

                    -- Confirm with Enter
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- only confirm if something is selected

                    -- Optional: fallback for other keys
                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
                },
                sources = {
                    -- { name = "supermaven" , priority = 1000 }, -- Use supermaven
                    --{ name = "copilot", group_index = 2 },
                    { name = "nvim_lsp" }, -- Use LSP source
                    { name = "buffer" }, -- Use buffer source
                    { name = "path" }, -- Use path source
                    { name = "luasnip" }, -- Use snippet source

                },
                -- COMMENTING AS, INLINE SEEMS BETTER
                -- formatting = {
                --   format = function(entry, vim_item)
                --     local kind_format = require("lspkind").cmp_format({
                --       mode = "symbol_text",
                --       maxwidth = 50,
                --       ellipsis_char = "...",
                --     })(entry, vim_item)
                --     if entry.source.name == "supermaven" then
                --       kind_format.kind = " Supermaven"
                --       kind_format.kind_hl_group = "CmpItemKindSupermaven"
                --     end
                --     return kind_format
                --   end,
                -- }
            })
        end,
    },
    -- Not working great so commenting for now
    -- {
    --   "zbirenbaum/copilot-cmp",
    --   config = function ()
    --     require("copilot_cmp").setup()
    --   end
    -- },
    -- Auto Pairs for opening closing charachters.
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
}
