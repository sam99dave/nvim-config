  return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
          ensure_installed = {
            "bash",
            "json",
            "lua",
            "python",
            "regex",
            "vim",
            "yaml",
          },
          highlight = { enable = true },
          indent = { enable = true },
        },
    },
  }
