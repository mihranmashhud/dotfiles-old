local function merge(t1, t2)
  if t1 == nil then return t2 end
  for k,v in ipairs(t2) do
    table.insert(t1,v)
  end
  return t1
end

--- Add which-key info for a keybind
local function add_info(keys, name)
  -- Find our info table and strip the prefix
  local t
  if vim.startswith(keys, "<leader>") then
    keys = keys:sub(9)
    t = keybind._leader_info
  else
    return
  end

  -- Find/create tables along the path
  local keys_split = split_keys(keys)
  local final_key = keys_split[#keys_split]
  keys_split[#keys_split] = nil
  for _, key in ipairs(keys_split) do
    local new_t = t[key]
    if new_t == nil then
      new_t = {}
      t[key] = new_t
    end
    t = new_t
  end

  t[final_key] = name
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
