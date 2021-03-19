local utils = {}
-- Split by sep
function utils.split(str, sep)
   local result = {}
   local regex = ("([^%s]+)"):format(sep)
   for each in str:gmatch(regex) do
      table.insert(result, each)
   end
   return result
end
-- Split by lines
function utils.lines(str)
   return utils.split(str, '\n')
end
-- Scale an array to int array
function utils.scale(arr, scalar)
   local res = {}
   for _, val in ipairs(arr) do
      table.insert(res, math.floor(val*scalar))
   end
   return res
end
-- Clamp number between min and max
function utils.clamp(x, min, max)
   if min <= x and x <= max then
      return x
   elseif x < min then
      return min
   else
      return max
   end
end

utils.INDENT_LEVEL = 2

local function pprint_str(t, indent)
   if type(t) == 'table' then
      local repr = '{\n'
      for k,v in pairs(t) do
         repr = repr..(' '):rep(indent)..pprint_str(k)..' = '..pprint_str(v, indent + utils.INDENT_LEVEL)..',\n'
      end
      repr = repr..(' '):rep(indent-utils.INDENT_LEVEL)..'}'
      return repr
   elseif type(t) == 'string' then
      return '"'..t..'"'
   else
      return tostring(t)
   end
end

function pprint(t)
   print(pprint_str(t, utils.INDENT_LEVEL))
end

return utils
