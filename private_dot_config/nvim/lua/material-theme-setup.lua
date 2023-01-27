vim.g.material_style = "darker"
vim.opt.colorcolumn = "81"
vim.opt.termguicolors = true

vim.cmd.highlight("ColorColumn guibg=gray")

require('material').setup({
    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        -- "gitsigns",
        -- "hop",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        -- "telescope",
        -- "trouble",
        -- "which-key",
    },
    lualine_style = 'stealth'
})

vim.cmd.colorscheme("material")
