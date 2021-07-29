require('lspsaga').init_lsp_saga{
  -- default value
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  code_action_icon = ' ',
  dianostic_header_icon = '   ',
  code_action_prompt = {
    enable = true,
    sign = false,
    virtual_text = false,
  },
  code_action_keys = { quit = '<Esc>',exec = '<CR>' },
  finder_definition_icon = 'Defs - ',
  finder_reference_icon = 'Refs - ',
  finder_action_keys = {
    open = 'o', vsplit = 'v',split = 'h',quit = '<Esc>',scroll_down = '<C-f>', scroll_up = '<C-b>'
  },
  rename_prompt_prefix = '>',
}
