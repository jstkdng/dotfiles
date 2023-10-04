---
-- Global Config
---

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lfs = require("lfs")

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
    float = { border = "rounded" },
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.opt.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Always show signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved
vim.opt.signcolumn = "yes"

vim.opt.hidden = true

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

---
-- LSP Servers
---

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            telemetry = {
                enable = false
            },
            completion = {
                callSnippet = "Replace"
            },
            workspace = {
                library = {
                    "/usr/share/awesome/lib",
                    "/usr/lib/lua-language-server/meta/3rd/lfs/",
                    vim.api.nvim_get_runtime_file("", true)
                },
                checkThirdParty = false
            },
            diagnostics = {
                globals = {
                    "vim", "awesome", "client", "root", "screen"
                }
            }
        }
    }
})

lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        plugins = {
            flake8 = {
                enabled = true
            }
        }
    }
})

lspconfig.cmake.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.texlab.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        texlab = {
            build = {
                onSave = true,
                args = {""}
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true
            },
            rootDirectory = lfs.currentdir()
        }
    }
})
