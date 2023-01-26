require("plugins")
require("bufferline-setup")
require("lualine-setup")
require("material-theme-setup")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("filetype plugin indent on")

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
    float = { border = "rounded" },
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.opt.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Always show signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved
vim.opt.signcolumn = "yes"

vim.opt.hidden = true

-- better editing
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "81"
vim.cmd.highlight("ColorColumn guibg=gray")

vim.cmd.colorscheme("material")
vim.opt.termguicolors = true

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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function ()
        vim.opt_local.cinoptions =  "L0"
    end
})

require("lspconfig-setup")
require("clangd-setup")
require("nvim-cmp-setup")
require("nvim-tree-setup")
require("nvim-treesitter-setup")
