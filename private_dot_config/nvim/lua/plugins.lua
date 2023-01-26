vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        tag = "nightly"
    }

    use "neovim/nvim-lspconfig"

    use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
    use "marko-cerovac/material.nvim"

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons"}
    }

    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true})
            ts_update()
        end,
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use "p00f/clangd_extensions.nvim"
end)
