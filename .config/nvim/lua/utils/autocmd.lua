local M = {}
M._bound_funcs = {}
local cmd = vim.cmd

function M.augroup(autocmds, name)
   cmd('augroup '..name)
   cmd('autocmd!')
   for _, autocmd in ipairs(autocmds) do
      cmd('autocmd '..autocmd)
   end
   cmd('augroup END')
end

function M.autocmd(expr)
   if type(expr) == 'string' then
      cmd('autocmd '..expr)
   elseif type(expr) == 'function' then
         -- TODO: make bind funcs ability
      --M._bound_funcs[#M._bound_funcs+1] = expr
      --cmd'autocmd lua require("utils.autocmd")._bound_funcs['..#M._bound_funcs..']()'
   end
end

return M
