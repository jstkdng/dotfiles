-- keybindings

vim.keymap.set("n", "<C-a>", ":NvimTreeToggle<CR>")

vim.g.nvim_tree_auto_close = 1

require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true
    }
})
