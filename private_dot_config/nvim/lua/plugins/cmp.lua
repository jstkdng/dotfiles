return {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    'saadparwaiz1/cmp_luasnip',
    {
        "hrsh7th/nvim-cmp",
        config = function(_, opts)
            vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
            require('luasnip.loaders.from_vscode').lazy_load()
            local cmp = require("cmp")
            local luasnip = require('luasnip')

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp',               keyword_length = 3 },
                    --{name = 'buffer', keyword_length = 3},
                    { name = 'luasnip',                keyword_length = 2 },
                    { name = 'nvim_lsp_signature_help' }
                },
                window = {
                    documentation = cmp.config.window.bordered(),
                    completion = cmp.config.window.bordered(),
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.recently_used,
                        require("clangd_extensions.cmp_scores"),
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),

                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-d>'] = cmp.mapping(
                        function(fallback)
                            if luasnip.jumpable(1) then
                                luasnip.jump(1)
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                    ['<C-b>'] = cmp.mapping(
                        function(fallback)
                            if luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                    ['<Tab>'] = cmp.mapping(
                        function(fallback)
                            local col = vim.fn.col('.') - 1

                            if cmp.visible() then
                                cmp.select_next_item(select_opts)
                            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                                fallback()
                            else
                                cmp.complete()
                            end
                        end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item(select_opts)
                            else
                                fallback()
                            end
                        end, { 'i', 's' }),
                }
            })
        end
    }
}
