-- No default mappings
vim.g.kommentary_create_default_mappings = false
vim.cmd('packadd kommentary')

local config_lang = require'kommentary.config'.configure_language

config_lang("default", {
  prefer_single_line_comments = true,
})
