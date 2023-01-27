require("plugins")
require("bufferline-setup")
require("lualine-setup")
require("material-theme-setup")
require("lspconfig-setup")
require("clangd-setup")
require("nvim-cmp-setup")
require("nvim-tree-setup")
require("neogit-setup")
require("nvim-treesitter-setup")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("filetype plugin indent on")

-- better editing
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 10

-- clipboard config
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = ""

-- natural splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- disable providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

