vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("filetype plugin indent on")

-- some servers have issues with backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved
vim.opt.signcolumn = "yes"

-- better editing
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "81"
vim.cmd.highlight("ColorColumn guibg=gray")

vim.cmd.colorscheme("darcula-solid")
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
require("nvim-cmp-setup")
