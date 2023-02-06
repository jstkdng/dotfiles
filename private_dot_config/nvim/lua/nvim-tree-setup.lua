vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 40
    },
    filters = {
        dotfiles = true
    },
    tab = {
        sync = {
            open = true,
            close = true
        }
    },
    renderer = {
        group_empty = true
    }
})

