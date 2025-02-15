return {
    require("plugins.treesitter"),
    require("plugins.lsp"),
    require("plugins.telescope"), -- This should be loaded before snacks as snacks uses it.
    require("plugins.snacks"),
    require("plugins.rose-pine"),
    require("plugins.lualine")
}
