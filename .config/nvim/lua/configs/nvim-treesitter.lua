vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
	indent = {
		enable = true,
	},
}

