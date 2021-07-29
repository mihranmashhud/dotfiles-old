local map = {}

map._leader_info = {}

local ok, wk = pcall(require, 'which-key') -- prevent breaking if which key is not installed
if not ok then wk = nil end

if wk then
  wk.setup{
    window = {
      border = "single",
    },
  }
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
--
-- @tparam string key sequence to split
function map.split_keys(keys)
   return seqchoice(keys, {'<[A-Za-z-]+>', '.'})
end

--- Add which-key info for a keybind
local function add_info(keys, name)
  if wk then
    wk.register({ [keys] = { name } })
  end
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
  func_name_escaped = func_name_escaped:gsub("'", "\\'")
  func_name_escaped = func_name_escaped:gsub('"', '\\"')
  func_name_escaped = func_name_escaped:gsub("\\[", "\\[")
  func_name_escaped = func_name_escaped:gsub("\\]", "\\]")
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

    if type(name) == 'string' then
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

    if type(name) == 'string' then
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
function map.set_group_name(keys, group_name)
  if wk then
    wk.register({ [keys] = { name = group_name }})
  end
end

--- Helper functions
local function merge(t1, t2)
  local t = t1
  for k,v in ipairs(t2) do
    t[k] = v
  end
  return t
end
--- Replace termcodes in string
--
-- @tparam string replace termcodes
function map.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.imap(keyseq, command, options, name)
  return map.bind_command('i', keyseq, command, options or {}, name)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.nmap(keyseq, command, options, name)
  return map.bind_command('n', keyseq, command, options or {}, name)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.smap(keyseq, command, options, name)
  return map.bind_command('s', keyseq, command, options or {}, name)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.inoremap(keyseq, command, options, name)
  return map.bind_command('i', keyseq, command, merge(options, {noremap = true}), name)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.nnoremap(keyseq, command, options, name)
  return map.bind_command('n', keyseq, command, merge(options, {noremap = true}), name)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.vnoremap(keyseq, command, options, name)
  return map.bind_command('v', keyseq, command, merge(options, {noremap = true}), name)
end
-- @tparam string keys The keys to press (eg: `<leader>feR`)
-- @tparam string command The Vim command to bind to the key sequence (eg: `:source $MYVIMRC<CR>`)
-- @tparam table options See `https://neovim.io/doc/user/api.html#nvim_set_keymap()` (eg: `{ noremap = true }`)
-- @tparam[opt] string name A helpful display name
function map.tnoremap(keyseq, command, options, name)
  return map.bind_command('t', keyseq, command, merge(options, {noremap = true}), name)
end

return map
