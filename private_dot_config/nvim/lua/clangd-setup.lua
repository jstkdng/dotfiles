require("clangd_extensions").setup({
    server = {
        cmd = {
            "clangd",
            "--header-insertion=never",
            "--completion-style=detailed"
        }
    },
    extensions = {
        autoSetHints = false
    }
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function ()
        vim.opt_local.cinoptions =  "L0"
    end
})
