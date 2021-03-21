local map_utils = require'utils.map'
local imap = map_utils.imap
local nmap = map_utils.nmap
local inoremap = map_utils.inoremap
local nnoremap = map_utils.nnoremap
local vnoremap = map_utils.vnoremap
local tnoremap = map_utils.tnoremap
local set_group_name = map_utils.set_group_name
local t = map_utils.t

vnoremap('<', '<gv')
vnoremap('>', '>gv')

inoremap('<C-j>', '('..t('<C-n>')..')', { expr = true })
inoremap('<C-k>', '('..t('<C-p>')..')', { expr = true })

-- Causes recursive map otherwise
vim.api.nvim_exec([[
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
]], false)

inoremap('jk', '<Esc>')
inoremap('kj', '<Esc>')
tnoremap('jk', '<Esc>')
tnoremap('kj', '<Esc>')

nnoremap('<M-j>', ':resize -2<CR>', { silent = true })
nnoremap('<M-k>', ':resize +2<CR>', { silent = true })
nnoremap('<M-h>', ':vertical resize -2<CR>', { silent = true })
nnoremap('<M-l>', ':vertical resize +2<CR>', { silent = true })

imap('<Tab>', '<Plug>(completion_smart_tab)')
imap('<S-Tab>', '<Plug>(completion_smart_s_tab)')

nnoremap('<F3>', ':w !detex \\| wc -w<CR>')

-- WhichKey/Leader:
vim.g.mapleader = ' '
nmap('<Space>', '')
vim.g.which_key_sep = '→'
vim.g.which_key_use_floating_win = 0
map_utils.enable_whichkey()
local opts = { silent = true }

nnoremap('<leader>/', '<plug>NERDCommenterToggle', opts, 'comment')
vnoremap('<leader>/', '<plug>NERDCommenterToggle')
nnoremap('<leader>;', ':Commands<CR>', opts, 'commands')
nnoremap('<leader>=', '<C-w>=', opts, 'balance windows')
nnoremap('<leader>,', 'Startify', opts, 'start screen')
nnoremap('<leader>c', ':Codi!!<CR>', opts, 'start screen')
nnoremap('<leader>f', ':Telescope find_files<CR>', opts, 'files')
nnoremap('<leader>z', ':Goyo<CR>', opts, 'zen mode')
nnoremap('<leader>h', ':noh<CR>', opts, 'remove search highlight')
nnoremap('<leader>q', ':bd<CR>', opts, 'quit buffer')

set_group_name('<leader>a', 'Actions')
nnoremap('<leader>ac', ':ColorizerToggle<CR>', opts, 'colorizer')
nnoremap('<leader>ae', ':NvimTreeToggle<CR>', opts, 'explorer')
nnoremap('<leader>au', ':UndotreeToggle<CR>', opts, 'undo tree')
nnoremap('<leader>an', ':DashboardNewFile<CR>', opts, 'new file')
-- TODO: tag bar mapping

set_group_name('<leader>s', 'Search')
nnoremap('<leader>sh', ':Telescope oldfiles<CR>', opts, 'file history')
nnoremap('<leader>s;', ':Telescope commands<CR>', opts, 'commands')
nnoremap('<leader>sb', ':Telescope current_buffer_fuzzy_find<CR>', opts, 'current buffer')
nnoremap('<leader>sB', ':Telescope buffers<CR>', opts, 'buffers')
nnoremap('<leader>sc', ':Telescope git_commits<CR>', opts, 'commits')
nnoremap('<leader>sC', ':Telescope git_buffer_commits<CR>', opts, 'buffer commits')
nnoremap('<leader>sH', ':Telescope command_history<CR>', opts, 'command history')
nnoremap('<leader>sm', ':Telescope marks<CR>', opts, 'marks')
nnoremap('<leader>sM', ':Telescope keymaps<CR>', opts, 'keymaps')
nnoremap('<leader>sp', ':Telescope help_tags<CR>', opts, 'help tags')
nnoremap('<leader>sP', ':Telescope tags<CR>', opts, 'tags')
nnoremap('<leader>ss', ':Telescope snippets snippets<CR>', opts, 'snippets')
nnoremap('<leader>sS', ':Telescope colorscheme<CR>', opts, 'colorscheme')
nnoremap('<leader>st', ':Telescope current_buffer_tags<CR>', opts, 'buffer tags')
nnoremap('<leader>sy', ':Telescope filetypes<CR>', opts, 'filetypes<CR>')
nnoremap('<leader>sf', ':Telescope find_files<CR>', opts, 'files')
nnoremap('<leader>sw', ':Telescope live_grep<CR>', opts, 'live grep')

set_group_name('<leader>S', 'Session')
nnoremap('<leader>SS', ':SessionSave<CR>', opts, 'save session')
nnoremap('<leader>SL', ':SessionLoad<CR>', opts, 'last session')

set_group_name('<leader>x', 'Execute')
nnoremap('<leader>xc', ':lua require("utils.debug").execute_line()<CR>', opts, 'current line')
nnoremap('<leader>xf', ':lua require("utils.debug").load_file()<CR>', opts, 'file')
vnoremap('<leader>xx', ':lua require("utils.debug").execute_visual_selection()<CR>', opts, 'selection')

set_group_name('<leader>g', 'Git')
nnoremap('<leader>ga', ':Git add .<CR>', opts, '')
nnoremap('<leader>gA', ':Git add %<CR>', opts, '')
nnoremap('<leader>gb', ':Git blame<CR>', opts, '')
nnoremap('<leader>gB', ':GBrowse<CR>', opts, '')
nnoremap('<leader>gc', ':Git commit<CR>', opts, '')
nnoremap('<leader>gd', ':Git diff<CR>', opts, '')
nnoremap('<leader>gD', ':Gdiffsplit<CR>', opts, '')
nnoremap('<leader>gg', ':GGrep<CR>', opts, '')
nnoremap('<leader>gG', ':Gstatus<CR>', opts, '')
nnoremap('<leader>gh', ':GitGutterLineHighlightsToggle<CR>', opts, '')
nnoremap('<leader>gH', '<Plug>(GitGutterPreviewHunk)', opts, '')
nnoremap('<leader>gj', '<Plug>(GitGutterNextHunk)', opts, '')
nnoremap('<leader>gk', '<Plug>(GitGutterPrevHunk)', opts, '')
nnoremap('<leader>gl', ':Git log<CR>', opts, '')
nnoremap('<leader>gp', ':Git pull<CR>', opts, '')
nnoremap('<leader>gP', ':Git push<CR>', opts, '')
nnoremap('<leader>gr', ':GRemove<CR>', opts, '')
nnoremap('<leader>gs', '<Plug>(GitGutterStageHunk)', opts, '')
nnoremap('<leader>gt', ':GitGutterSignsToggle<CR>', opts, '')
nnoremap('<leader>gu', '<Plug>(GitGutterUndoHunk)', opts, '')
nnoremap('<leader>gv', ':GV<CR>', opts, '')
nnoremap('<leader>gV', ':GV!<CR>', opts, '')
