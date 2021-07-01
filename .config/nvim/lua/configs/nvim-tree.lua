local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_width = 30                                    -- 30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
vim.g.nvim_tree_auto_close = 1                                -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}    -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1                              -- 0 by default, closes the tree when you open a file
                                                              -- vim.g.nvim_tree_follow = 1, 0 by default, this option allows the cursor to be updated when entering a buffer
                                                              -- vim.g.nvim_tree_indent_markers = 1, 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1                                    -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_tab_open = 0                                  -- 0 by default, will open the tree when entering a new tab and the tree was previously open

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
vim.g.nvim_tree_bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["<2-LeftMouse>"]  = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<C-]>"]          = tree_cb("cd"),
  ["v"]              = tree_cb("vsplit"),
  ["s"]              = tree_cb("split"),
  ["t"]              = tree_cb("tabnew"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["r"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["R"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["y"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
