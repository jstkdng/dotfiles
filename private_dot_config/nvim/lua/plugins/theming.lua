vim.g.material_style = "darker"

return {
    {
        "marko-cerovac/material.nvim",
        opts = {
            plugins = {
                -- Available plugins:
                -- "dap",
                -- "dashboard",
                -- "gitsigns",
                -- "hop",
                -- "indent-blankline",
                -- "lspsaga",
                -- "mini",
                --"neogit",
                "nvim-cmp",
                -- "nvim-navic",
                "nvim-tree",
                "nvim-web-devicons",
                -- "sneak",
                -- "telescope",
                -- "trouble",
                -- "which-key",
            },
            lualine_style = "stealth",
        }
    },
    {
        "akinsho/bufferline.nvim",
        branch = "main",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true
                    }
                }
            }
        },
        config = function(_, opts)
            vim.opt.termguicolors = true
            vim.cmd.highlight("ColorColumn guibg=gray")
            vim.cmd.colorscheme("material")
            vim.opt.colorcolumn = "121"
            vim.opt.cursorline = true
            require("bufferline").setup(opts)
        end
    },
}
