-- Options are automatically loaded before lazy.nvim startup

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4 -- Use 4 spaces for indentation
vim.opt.softtabstop = 4 -- Pressing tab inserts 4 spaces
vim.opt.number = true
vim.opt.relativenumber = true

-- Treesitter folding
-- Won't retain the folds on buffer switch, for that functionality check nvim-ufo
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
