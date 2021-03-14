local utils = {}
local function merge(t1, t2)
  if t1 == nil then return t2 end
  for k,v in ipairs(t2) do
    table.insert(t1,v)
  end
  return t1
end
function utils.escseq(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
function utils.imap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('i', keyseq, expr, options or {})
end
function utils.nmap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('n', keyseq, expr, options or {})
end
function utils.vmap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('v', keyseq, expr, options or {})
end
function utils.nmapbuf(keyseq, expr, options)
  return vim.api.nvim_buf_set_keymap('n', keyseq, expr, options or {})
end
function utils.inoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('i', keyseq, expr, merge(options, {noremap = true}))
end
function utils.nnoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('n', keyseq, expr, merge(options, {noremap = true}))
end
function utils.vnoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('v', keyseq, expr, merge(options, {noremap = true}))
end
function utils.tnoremap(keyseq, expr, options)
  return vim.api.nvim_set_keymap('t', keyseq, expr, merge(options, {noremap = true}))
end

return utils
