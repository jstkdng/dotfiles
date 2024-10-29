vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<C-a>", ":NvimTreeToggle<CR>")

vim.g.nvim_tree_auto_close = 1

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    branch = "master",
    opts = {
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
    }
}
