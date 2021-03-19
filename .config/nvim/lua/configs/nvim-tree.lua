vim.g.nvim_tree_disable_keybindings = 1
vim.g.nvim_tree_width = 30                                    -- 30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
vim.g.nvim_tree_auto_close = 1                                -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}    -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1                              -- 0 by default, closes the tree when you open a file
                                                              -- vim.g.nvim_tree_follow = 1, 0 by default, this option allows the cursor to be updated when entering a buffer
                                                              -- vim.g.nvim_tree_indent_markers = 1, 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1                                    -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_tab_open = 1                                  -- 0 by default, will open the tree when entering a new tab and the tree was previously open

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
     default = '',
     symlink = '',
     git = {
       unstaged = "✗",
       staged = "✓",
       unmerged = "",
       renamed = "➜",
       untracked = "★"
       },
     folder = {
       default = "",
       open = "",
       empty = "",
       empty_open = "",
       symlink = "",
       }
     }
