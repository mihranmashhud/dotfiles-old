local autocmd = require'utils.autocmd'.autocmd

local theming = {}


local default_palette = {
  Red = '#ec5f67',
  Orange = '#ff8800',
  Yellow = '#e8ec67',
  Green = '#98be65',
  Blue = '#51afef',
  Purple = '#a9a1e1',
  Grey = '#5a5766',
  Fg = '#fffffc',
}

local function clamp(val, from, to)
  if val == nil then return end
  if val < from then
    return from
  elseif val > to then
    return to
  end
  return val
end

local function scale(t, scalar)
  if t == nil then return end
  local new_t = {}
  for i,v in ipairs(t) do
    new_t[i] = v*scalar
  end
  return new_t
end

function theming.quick_saturate(color, val)
  if color == nil then return end
  local r = color[1]
  local g = color[2]
  local b = color[3]
  local gray = 0.2989*r + 0.5870*g + 0.1140*b
  local c = {}
  c[1] = clamp(-gray*val + r*(1+val), 0, 255)
  c[2] = clamp(-gray*val + g*(1+val), 0, 255)
  c[3] = clamp(-gray*val + b*(1+val), 0, 255)
  return c
end

function theming.hl_color_t(str)
  if type(str) == 'string' then
    local ok, hl = pcall(vim.api.nvim_get_hl_by_name, str, true)
    if ok then
      local color
      if hl.foreground then
        color = ('%06x'):format(hl.foreground)
      else
        color = default_palette[str]
        color = string.sub(color, 2,-1)
      end
      local color_t = {}
      for val in color:gmatch('..') do
        table.insert(color_t, tonumber(val, 16))
      end
      return color_t
    end
  end
end

-- Darken color array
function theming.darken(color, percent)
  if color == nil then return end
  local c = {}
  for i,val in ipairs(scale(color, 1 - percent)) do
    c[i] = clamp(val, 0, 255)
  end
  return c
end

-- Lighten color array
function theming.lighten(color, percent)
  if color == nil then return end
  local c = {}
  for i,val in ipairs(scale(color, 1 + percent)) do
    c[i] = clamp(val, 0, 255)
  end
  return c
end

function theming.interpolate(c1, c2, percent)
  if c1 == nil or c2 == nil then return end
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
    palette['Dark'..color] = theming.quick_saturate(theming.darken(
      palette[color], 0.4
    ), 0.2)
    palette['Light'..color] = theming.quick_saturate(theming.lighten(
      palette[color], 0.2
    ), 0.2)
  end
  -- Assume lightened LightGrey is White
  palette['White'] = theming.lighten(palette['LightGrey'], 1.7)
  -- Assume darkened DarkGrey is Black
  palette['Black'] = theming.darken(palette['DarkGrey'], 0.5)
  -- Interpolate Cyan
  palette['Cyan'] = theming.interpolate(palette['LightGreen'], palette['LightBlue'], 0.7)
  palette['Cyan'] = theming.quick_saturate(palette['Cyan'], 0.2)
  -- Get Fg
  palette['Fg'] = theming.hl_color_t('Fg')
  -- Use Black as Bg
  palette['Bg'] = palette['Black']

  palette['Violet'] = palette['Purple']

  local lowered = {}
  for k,v in pairs(palette) do
    lowered[k:lower()] = v
  end
  palette = vim.tbl_extend("keep", palette, lowered)
  return palette
end

function theming.make_hex_palette()
  local hex_palette = {}
  for color, arr in pairs(theming.palette) do
    local hex = '#'
    for _, x in ipairs(arr) do
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
