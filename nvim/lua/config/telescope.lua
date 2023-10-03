local M = {}


M.config = function()
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local trouble = require 'trouble.providers.telescope'
    local telescope = require 'telescope'

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ['<c-t>'] = trouble.open_with_trouble
                },
                n = {
                    ['<c-t>'] = trouble.open_with_trouble
                }
            }
        }
    }
end

return M
