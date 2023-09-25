local M = {}

M.config = function()
local lsp = require 'lspconfig'
local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

-- vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

lsp.rust_analyzer.setup {

}

lsp.clangd.setup {
    cmd = { "clangd", "--clang-tidy" },
    capabilities = capabilities,
}

lsp.rust_analyzer.setup {
    capabilities = capabilities,
}

lsp.gopls.setup {
    capabilities = capabilities,
}

lsp.lua_ls.setup {
    capabilities = capabilities,
}

lsp.hls.setup {
    capabilities = capabilities, }

lsp.emmet_ls.setup {
    filetypes = { 'html', 'vue' },
    capabilities = capabilities,
}

lsp.julials.setup {
    capabilities = capabilities,
}

lsp.pyright.setup {
    capabilities = capabilities,
}

lsp.svelte.setup { capabilities = capabilities, }

vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.format() ]]

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})
end

return M
