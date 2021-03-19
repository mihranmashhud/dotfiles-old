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

set_group_name('<leader>a', 'Actions')
nnoremap('<leader>ac', ':ColorizerToggle<CR>', {}, 'colorizer')
nnoremap('<leader>ae', ':NvimTreeToggle<CR>', {}, 'explorer')
nnoremap('<leader>au', ':UndotreeToggle<CR>', {}, 'undo tree')
nnoremap('<leader>an', ':DashboardNewFile<CR>', {}, 'new file')
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
nnoremap('<leader>sy', ':Telescope filetypes', opts, 'filetypes<CR>')
nnoremap('<leader>sf', ':Telescope find_files<CR>', opts, 'files')
nnoremap('<leader>sw', ':Telescope live_grep<CR>', opts, 'live grep')

set_group_name('<leader>S', 'Session')
nnoremap('<leader>SS', ':SessionSave<CR>', opts, 'save session')
nnoremap('<leader>SL', ':SessionLoad<CR>', opts, 'save session')

set_group_name('<leader>g', 'Git')
-- TODO: Git mappings

