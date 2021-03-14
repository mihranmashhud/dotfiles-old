local function merge(t1, t2)
  if t1 == nil then return t2 end
  for k,v in ipairs(t2) do
    table.insert(t1,v)
  end
  return t1
end
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local function imap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('i', keyseq, expr, options or {})
end
local function nmap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('n', keyseq, expr, options or {})
end
local function vmap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('v', keyseq, expr, options or {})
end
local function nmapbuf(keyseq, expr, options)
  return vim.api.nvim_buf_set_keymap('n', keyseq, expr, options or {})
end
local function inoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('i', keyseq, expr, merge(options, {noremap = true}))
end
local function nnoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('n', keyseq, expr, merge(options, {noremap = true}))
end
local function vnoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('v', keyseq, expr, merge(options, {noremap = true}))
end
local function tnoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('t', keyseq, expr, merge(options, {noremap = true}))
end

vnoremap('<', '<gv')
vnoremap('>', '>gv')

inoremap('<C-j>', '('..t('<C-n>')..')', { expr = true })
inoremap('<C-k>', '('..t('<C-p>')..')', { expr = true })

nnoremap(';', ':')
nnoremap(':', ';')

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
