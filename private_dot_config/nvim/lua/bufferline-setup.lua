require("bufferline").setup({
    options = {
        diagnostics = "coc",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
    }
})


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("filetype plugin indent on")


