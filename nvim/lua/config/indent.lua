local M = {}

M.config = function()
    require 'ibl'.setup {
        indent = {
            smart_indent_cap = true,
        },
    }
end

return M
