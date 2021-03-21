local debug = {}

local function get_visual_selection()
  vim.cmd('normal! gv"ay')
  return vim.fn.getreg('a')
end

-- Execute current line
function debug.execute_line()
  local line = vim.api.nvim_get_current_line()
  local ft = vim.bo.filetype
  if ft == 'lua' then
    loadstring(line)
  elseif ft == 'vim' then
    vim.cmd(line)
  end
end

-- Execute visual selection
function debug.execute_visual_selection()
  local ft = vim.bo.filetype
  if ft == 'lua' then
    loadstring(get_visual_selection())()
  else
    vim.api.nvim_exec(get_visual_selection(), false)
  end
end

-- Load lua/vimscript file into vim
function debug.load_file()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  if ft == 'lua' then
    vim.cmd("luafile "..file)
  elseif ft == 'vim' then
    vim.cmd("source "..file)
  end
end

-- pprint
function vim.pprint(val)
  print(vim.inspect(val))
end
-- Reload
function Reload(modname)
  package.loaded[modname] = nil
  require(modname)
end

return debug
