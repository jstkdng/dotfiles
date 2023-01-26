vim.g.material_style = "darker"

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
        -- "neogit",
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

