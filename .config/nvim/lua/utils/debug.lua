local debug = {}

INDENT = 4

local function pprint(key, val, indent)
   local spacing = string.rep(' ', indent)
   if (type(val) == 'table') then
      if key then
         print(spacing..key..': {')
      end
      for k,v in ipairs(val) do
         pprint(k,v, indent + INDENT)
      end
      if key then
         print(spacing..'},')
      end
   elseif (type(val) == 'string') then
      print(spacing)
   else
      print(spacing..key..': '..val..',')
   end
end

function debug.pprint(...)
   for _, val in ipairs(...) do
      pprint(nil, val, INDENT)
   end
end

return debug
