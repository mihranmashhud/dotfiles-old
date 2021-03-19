local map = {}

map._leader_info = {}

function map.enable_whichkey()
  local leader = vim.api.nvim_get_var("mapleader")
  local escaped_leader = leader:gsub("'", "\\'")
  local leader_cmd = ":WhichKey '"..escaped_leader.."'<CR>"
  local leader_cmd_visual = ":WhichKeyVisual '"..escaped_leader.."'<CR>"
  map.bind_command('n', leader, leader_cmd, {noremap = true, silent = true})
  map.bind_command('v', leader, leader_cmd_visual, {noremap = true, silent = true})
  vim.api.nvim_exec([[
    highlight default link WhichKey          Operator
    highlight default link WhichKeySeperator DiffAdded
    highlight default link WhichKeyGroup     Identifier
    highlight default link WhichKeyDesc      Function

    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2
  ]], false)
  vim.fn['which_key#register'](leader, 'g:which_key_map')
end

--- Greedy pattern matching on multiple patterns
local function seqchoice(str, patternlist)
  local substr = str
  local result = {}
  while (substr ~= '') do
    local b = nil
    local e = nil
    for _, pattern in ipairs(patternlist) do
      b, e = substr:find(pattern)
      if b == 1 then
        break
      end
    end
    if b ~= 1 then
      break
    end
    table.insert(result, substr:sub(b,e))
    substr = substr:sub(e+1)
  end
  return result
end

--- Split a key sequence string like "<S-tab>fed" into { "<S-tab>", "f", "e", "d" }
local function split_keys(keys)
   return seqchoice(keys, {'<[A-Za-z-]+>', '.'})
end

--- Add which-key info for a keybind
local function add_info(keys, name)
  -- Find our info table and strip the prefix
  local t
  if vim.startswith(keys, "<leader>") then
    keys = keys:sub(9)
    t = map._leader_info
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

  -- Update which_key_map
  vim.g.which_key_map = map._leader_info
end

map._bound_funcs = {}

--- Map a key sequence to a Lua command string for later use
--
-- @param mode An edit mode
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam function func The Lua function to bind to the key sequence
local function make_func_avail(mode, keys, func)

  local func_name = "bind_" .. mode .. "_" .. keys

  local func_name_escaped = func_name
  -- Escape Lua things
  func_name_escaped = func_name_escaped:gsub("'", "\\'")
  func_name_escaped = func_name_escaped:gsub('"', '\\"')
  func_name_escaped = func_name_escaped:gsub("\\[", "\\[")
  func_name_escaped = func_name_escaped:gsub("\\]", "\\]")

  -- Escape VimScript things
  -- We only escape `<` - I couldn't be bothered to deal with how <lt>/<gt> have angle brackets in themselves
  func_name_escaped = func_name_escaped:gsub("<", "<lt>")

  map._bound_funcs[func_name] = func

  local lua_command = ":lua require('utils.map')._bound_funcs['" .. func_name_escaped .. "']()<CR>"
  -- Prefix with <C-o> if this is an insert-mode mapping
  if mode.map_prefix == "i" then
    lua_command = "<C-o>" .. lua_command
  end

  return lua_command
end

--- Map a key sequence to a Lua function
--
-- @param mode An edit mode
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam function func The Lua function to bind to the key sequence
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name for whichkey
function map.bind_function(mode, keys, func, options, name)
  options = options or {}
  local lua_command = make_func_avail(mode, keys, func)

  vim.api.nvim_set_keymap(mode, keys, lua_command, options)

  if type(name) == 'string' then
    add_info(keys, name)
  end
end

--- Map a key sequence to a Lua function
--
-- @param mode An edit mode
-- @tparam number buffer the buffer to attach this mapping to
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam function func The Lua function to bind to the key sequence
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name for whichkey
function map.buf_bind_function(buf, mode, keys, func, options, name)
  options = options or {}
  local lua_command = make_func_avail(mode, keys, func)

  vim.api.nvim_buf_set_keymap(buf, mode, keys, lua_command, options)

  if type(name) == 'string' then
    add_info(keys, name)
  end
end

--- Map a key sequence to a Vim command
--
-- @tparam string An edit mode.
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.bind_command(mode, keys, command, options, name)
  options = options or {}
  if type(command) == 'string' then
    vim.api.nvim_set_keymap(mode, keys, command:gsub('^:', '<Cmd>'), options)

    if name ~= nil then
      add_info(keys, name)
    end
  elseif type(command) == 'function' then
    map.bind_function(mode, keys, command, options, name)
  end
end

--- Map a key sequence to a Vim command
--
-- @param mode An edit mode from `c.edit_mode`
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.buf_bind_command(buf, mode, keys, command, options, name)
  options = options or {}

  if type(command) == 'string' then
    vim.api.nvim_buf_set_keymap(buf, mode, keys, command, options)

    if name ~= nil then
      add_info(keys, name)
    end
  elseif type(command) == 'function' then
    map.buf_bind_function(buf, mode, keys, command, options, name)
  end

end

--- Set a whichkey group name
--
-- @tparam string keys The keys sequence (eg: `<leader>fe`)
-- @tparam string name The group name (eg: `Editor`)
function map.set_group_name(keys, name)
  local t
  if vim.startswith(keys, "<leader>") then
    keys = keys:sub(9)
    t = map._leader_info
  else
    return
  end

  local keys_split = split_keys(keys)
  for _, key in ipairs(keys_split) do
    local new_t = t[key]
    if new_t == nil then
      new_t = {}
      t[key] = new_t
    end
    t = new_t
  end

  t.name = "+" .. name
end

---Helper functions
local function merge(t1, t2)
  local t = t1
  for k,v in ipairs(t2) do
    t[k] = v
  end
  return t
end
function map.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
function map.imap(keyseq, command, options, name)
  return map.bind_command('i', keyseq, command, options or {}, name)
end
function map.nmap(keyseq, command, options, name)
  return map.bind_command('n', keyseq, command, options or {}, name)
end
function map.inoremap(keyseq, command, options, name)
  return map.bind_command('i', keyseq, command, merge(options, {noremap = true}), name)
end
function map.nnoremap(keyseq, command, options, name)
  return map.bind_command('n', keyseq, command, merge(options, {noremap = true}), name)
end
function map.vnoremap(keyseq, command, options, name)
  return map.bind_command('v', keyseq, command, merge(options, {noremap = true}), name)
end
function map.tnoremap(keyseq, command, options, name)
  return map.bind_command('t', keyseq, command, merge(options, {noremap = true}), name)
end
return map
