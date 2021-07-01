local autocmd = require'utils.autocmd'.autocmd
local t = require'utils.map'.t
vim.o.shortmess = vim.o.shortmess..'c' -- Avoid short message

-- autocmd("BufEnter * lua require'completion'.on_attach()")
-- vim.g.completion_enable_snippet = 'snippets.nvim'
-- vim.g.completion_matching_smart_case = 1
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
-- vim.g.completion_chain_complete_list = {
--    {complete_items = {'lsp', 'snippet', 'tabnine', 'ts'}},
--    {mode = '<C-p>'},
--    {mode = '<C-n>'},
-- }

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local snippets = require'snippets'

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif snippets.has_active_snippet() then
    return t "<Plug>lua return require'snippets'.expand_or_advance(1)<CR>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif snippets.has_active_snippet() then
    return t "<Plug>lua return require'snippets'.advance_snippet(-1)<CR>"
  else
    return t "<S-Tab>"
  end
end

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    snippets_nvim = true;
    spell = true;
    tabnine = true;
    latex_symbols = true;
  };
}
