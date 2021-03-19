local scale = require'utils.utils'.scale
local clamp = require'utils.utils'.clamp
local autocmd = require'utils.autocmd'.autocmd

local theming = {}

function theming.hl_color_t(str)
   if type(str) == 'string' then
      local ok, hl = pcall(vim.api.nvim_get_hl_by_name, str, true)
      if ok then
         local color = ('%06x'):format(hl.foreground)
         local color_t = {}
         for val in color:gmatch('..') do
            table.insert(color_t, tonumber(val, 16))
         end
         return color_t
      else
         return {0,0,0}
      end
   end
end

-- Darken color array
function theming.darken(color, percent)
   for i,val in ipairs(scale(color, 1-percent)) do
      color[i] = clamp(val, 0, 255)
   end
   return color
end


-- Lighten color array
function theming.lighten(color, percent)
   for i,val in ipairs(scale(color, 1+percent)) do
      color[i] = clamp(val, 0, 255)
   end
   return color
end

function theming.interpolate(c1, c2, percent)
   local result = {}
   for i, val1 in ipairs(c1) do
      local val2 = c2[i]
      result[i] = math.floor(val1 + (val2 - val1) * percent)
   end
   return result
end

-- Compute palette table
function theming.compute_palette()
   local colors = {
      'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple', 'Grey'
   }
   local palette = {}
   for _, color in ipairs(colors) do
      palette[color] = theming.hl_color_t(color)
      palette['Dark'..color] = theming.darken(
         palette[color], 0.05
      )
      palette['Light'..color] = theming.lighten(
         palette[color], 0.05
      )
   end
   -- Assume Fg is White
   palette['White'] = theming.hl_color_t('Fg')
   -- Assume darkened DarkGrey is Black
   palette['Black'] = theming.darken(palette['DarkGrey'], 0.05)
   -- Interpolate Cyan
   palette['Cyan'] = theming.interpolate(palette['LightGreen'], palette['LightBlue'], 0.5)
   return palette
end

function theming.make_hex_palette()
   local hex_palette = {}
   for color, arr in ipairs(theming.palette) do
      local hex = '#'
      for _, x in arr do
         hex = hex..('%02x'):format(x)
      end
      hex_palette[color] = hex
   end
   return hex_palette
end

function theming.sync_palette()
   theming.palette = theming.compute_palette()
   theming.hex_palette = theming.make_hex_palette()
end

theming.sync_palette()
autocmd("ColorScheme * :lua require'utils.theming'.sync_palette()")

return theming
