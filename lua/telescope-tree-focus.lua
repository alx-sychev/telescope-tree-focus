local M = {
    find_command = {
        'fd',
        '--hidden',
        '--type',
        'directory',
        '--exclude',
        '.git',
    },
    prompt_title = "Find Directories",
    expand_focused = true,
}

function M.open_tree_and_focus(dir)
    local tree = require("nvim-tree.api").tree
    tree.open()
    tree.find_file({ buf = dir })
    if M.expand_focused then
        local node = require("nvim-tree.api").node
        node.open.edit()
    end
end

function M.attach_mappings(_, map)
    map('i', '<cr>', function(prompt_bufnr)
        local selection = require('telescope.actions.state')
            .get_selected_entry()
        local dir = selection.path
        require('telescope.actions').close(prompt_bufnr)
        M.open_tree_and_focus(dir)
        return true
    end)
    return true
end

function M.open_picker()
    local telescope = require('telescope.builtin')
    telescope.find_files({
        find_command    = M.find_command,
        prompt_title    = M.prompt_title,
        attach_mappings = M.attach_mappings,
    })
end

return M
