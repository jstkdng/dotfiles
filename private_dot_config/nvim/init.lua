local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

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

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("plugins")

vim.opt.rtp:prepend("/usr/share/vim/vimfiles/")
