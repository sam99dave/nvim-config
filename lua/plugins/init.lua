return {
    require("plugins.treesitter"),
    require("plugins.lsp"),
    require("plugins.telescope"), -- This should be loaded before snacks as snacks uses it.
    require("plugins.snacks"),
    require("plugins.rose-pine"),
    require("plugins.lualine"),
    require("plugins.copilot"),
    require("plugins.surround"),
   -- require("plugins.avante"),
    require("plugins.debugger"),
    require("plugins.harpoon"),
}
