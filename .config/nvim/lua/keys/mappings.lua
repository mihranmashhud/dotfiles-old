local map_utils = require'utils.map'
local imap = map_utils.imap
local nmap = map_utils.nmap
local smap = map_utils.smap
local inoremap = map_utils.inoremap
local nnoremap = map_utils.nnoremap
local vnoremap = map_utils.vnoremap
local tnoremap = map_utils.tnoremap
local set_group_name = map_utils.set_group_name
local t = map_utils.t

-- Indentation mapping
vnoremap('<', '<gv')
vnoremap('>', '>gv')

inoremap('<C-j>', '('..t('<C-n>')..')', { expr = true })
inoremap('<C-k>', '('..t('<C-p>')..')', { expr = true })
nnoremap('<C-j>', ':cnext<CR>', { silent = true })
nnoremap('<C-j>', ':cprev<CR>', { silent = true })

-- Causes recursive map otherwise
vim.api.nvim_exec([[
  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;
]], false)

-- Esc alias
inoremap('jk', '<Esc>')
inoremap('kj', '<Esc>')
tnoremap('jk', '<Esc>')
tnoremap('kj', '<Esc>')

-- Window resize
nnoremap('<M-j>', ':resize -2<CR>', { silent = true })
nnoremap('<M-k>', ':resize +2<CR>', { silent = true })
nnoremap('<M-h>', ':vertical resize -2<CR>', { silent = true })
nnoremap('<M-l>', ':vertical resize +2<CR>', { silent = true })

-- Completion with Tab
imap('<Tab>', 'v:lua.tab_complete()', { expr = true })
imap('<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
smap('<Tab>', 'v:lua.tab_complete()', { expr = true })
smap('<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Word count
nnoremap('<F3>', ':w !detex \\| wc -w<CR>')

-- WhichKey/Leader:
vim.g.mapleader = ' '
nmap('<Space>', '')

local opts = { silent = true }
nnoremap('<leader>/', '<Plug>kommentary_line_default', opts, 'comment')
vnoremap('<leader>/', '<Plug>kommentary_visual_default', opts)
nnoremap('<leader>;', ':Commands<CR>', opts, 'commands')
nnoremap('<leader>=', '<C-w>=', opts, 'balance windows')
nnoremap('<leader>,', ':Dashboard<CR>', opts, 'start screen')
nnoremap('<leader>c', ':Codi!!<CR>', opts, 'live repl')
nnoremap('<leader>f', ':Telescope find_files<CR>', opts, 'files')
nnoremap('<leader>z', ':Goyo<CR>', opts, 'zen mode')
nnoremap('<leader>h', ':noh<CR>', opts, 'remove search highlight')
nnoremap('<leader>q', ':bd<CR>', opts, 'quit buffer')
nnoremap('<leader>j', ':lnext<CR>', opts, 'loc next')
nnoremap('<leader>k', ':lprev<CR>', opts, 'loc prev')

set_group_name('<leader>a', 'Actions')
nnoremap('<leader>ac', ':ColorizerToggle<CR>', opts, 'colorizer')
nnoremap('<leader>ae', ':NvimTreeToggle<CR>', opts, 'explorer')
nnoremap('<leader>au', ':UndotreeToggle<CR>', opts, 'undo tree')
nnoremap('<leader>an', ':DashboardNewFile<CR>', opts, 'new file')
nnoremap('<leader>at', ':Vista<CR>', opts, 'view tags')

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
nnoremap('<leader>sy', ':Telescope filetypes<CR>', opts, 'filetypes')
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
nnoremap('<leader>gA', ':Git add .<CR>', opts, 'add all')
nnoremap('<leader>ga', ':Git add %<CR>', opts, 'add file')
nnoremap('<leader>gb', ':Git blame<CR>', opts, 'blame')
nnoremap('<leader>gB', ':GBrowse<CR>', opts, 'browse')
nnoremap('<leader>gc', ':Git commit<CR>', opts, 'commit')
nnoremap('<leader>gd', ':Git diff<CR>', opts, 'diff')
nnoremap('<leader>gD', ':Gdiffsplit<CR>', opts, 'diff split')
nnoremap('<leader>gg', ':GGrep<CR>', opts, 'grep')
nnoremap('<leader>gG', ':Gstatus<CR>', opts, 'status')
nnoremap('<leader>gt', ':GitGutterSignsToggle<CR>', opts, 'toggle signs')
nnoremap('<leader>gh', ':GitGutterLineHighlightsToggle<CR>', opts, 'hunk highlight')
nnoremap('<leader>gH', '<Plug>(GitGutterPreviewHunk)', opts, 'preview hunk')
nnoremap('<leader>gj', '<Plug>(GitGutterNextHunk)', opts, 'next hunk')
nnoremap('<leader>gk', '<Plug>(GitGutterPrevHunk)', opts, 'previous hunk')
nnoremap('<leader>gs', '<Plug>(GitGutterStageHunk)', opts, 'stage hunk')
nnoremap('<leader>gu', '<Plug>(GitGutterUndoHunk)', opts, 'undo hunk')
nnoremap('<leader>gl', ':Git log<CR>', opts, 'log')
nnoremap('<leader>gp', ':Git pull<CR>', opts, 'pull')
nnoremap('<leader>gP', ':Git push<CR>', opts, 'push')
nnoremap('<leader>gr', ':GRemove<CR>', opts, 'remove')

set_group_name('<leader>d', 'Debug')
nnoremap('<leader>db', ':lua require"dap".toggle_breakpoint()<CR>', opts, 'toggle breakpoint')
nnoremap('<leader>dc', ':lua require"dap".continue()<CR>', opts, 'continue')
nnoremap('<leader>dS', ':lua require"dap".step_over()<CR>', opts, 'step over')
nnoremap('<leader>ds', ':lua require"dap".step_into()<CR>', opts, 'step into')
nnoremap('<leader>dr', ':lua require"dap".repl.open()<CR>', opts, 'inspect in REPL')
