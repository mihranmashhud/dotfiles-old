vim.api.nvim_exec([[
colorscheme tokyonight
highlight VertSplit ctermbg=None guibg=None
highlight EndOfBuffer ctermbg=None guibg=None

" Git gutter
highlight GitGutterAdd ctermfg=None guibg=None
highlight GitGutterChange ctermbg=None guibg=None
highlight GitGutterDelete ctermbg=None guibg=None
highlight GitGutterChangeDelete ctermbg=None guibg=None
highlight GitGutterAddLine ctermbg=None guibg=None
highlight GitGutterChangeLine ctermbg=None guibg=None
highlight GitGutterDeleteLine ctermbg=None guibg=None
highlight GitGutterChangeDeleteLine ctermbg=None guibg=None
highlight GitGutterAddInvisible ctermbg=None guibg=None
highlight GitGutterChangeInvisible ctermbg=None guibg=None
highlight GitGutterDeleteInvisible ctermbg=None guibg=None
]], false)

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent_background = 1
