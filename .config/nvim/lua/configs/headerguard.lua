vim.fn.HeaderguardName = function ()
   return '_'..string.upper(vim.fn.expand('%:t:rs/[^0-9a-zA-Z_]/_/g'))..'_'
end

vim.fn.HeaderguardLine3 = function ()
   return '#endif'
end
