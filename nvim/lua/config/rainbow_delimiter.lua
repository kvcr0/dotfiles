local M = {}

M.config = function()
    local rainbow_delimiters = require'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'raindow-blocks',
        },
        highlight = {
            'RaindowDelimiterRed',
            'RaindowDelimiterYellow',
            'RaindowDelimiterBlue',
            'RaindowDelimiterOrange',
            'RaindowDelimiterGreen',
            'RaindowDelimiterViolet',
            'RaindowDelimiterCyan',
        }
    }
end

return M
