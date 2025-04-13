vim.cmd('source ~/.config/nvim/legacy.vim')
require('plugin_config')

local function get_current_function_name()
    local parsers = require'nvim-treesitter.parsers'
    local ts_utils = require'nvim-treesitter.ts_utils'

    local parser = parsers.get_parser()
    if not parser then
        print("No Treesitter parser available.")
        return nil
    end

    local root_tree = parser:parse()[1]:root()
    local current_node = ts_utils.get_node_at_cursor()

    while current_node do
        if current_node:type() == 'function_definition' then
            -- Accessing the child node directly for the function name
            local func_name_node = current_node:child(1) -- In Python, child 1 is the function name
            if func_name_node then
                local func_name = ts_utils.get_node_text(func_name_node)[1]
                return func_name
            end
        end
        current_node = current_node:parent()
    end

    return nil
end

local function run_functional_test()
    local file_path = vim.fn.expand('%:p') -- Gets the full path of the current file
    local func_name = get_current_function_name()
    if not func_name then
        print("No function found under cursor.")
        return
    end

    local command = string.format("bin/run_functional_tests_sf.sh %s::%s", file_path, func_name)
    vim.cmd('vsplit | terminal ' .. command)
end

vim.api.nvim_create_user_command('RunFunctionalTest', run_functional_test, {})
