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


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

return {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
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

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "cpp",
            callback = function ()
                vim.opt_local.cinoptions =  "L0"
            end
        })
        lspconfig.clangd.setup({
            cmd = {
                "clangd",
                "--header-insertion=never",
                "--completion-style=detailed"
            }
        })

        lspconfig.cmake.setup{}

        lspconfig.tsserver.setup{}

        lspconfig.bashls.setup{}
    end
}
