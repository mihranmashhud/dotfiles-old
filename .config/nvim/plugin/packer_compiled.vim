" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["BufOnly.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/BufOnly.vim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  Vimball = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/Vimball"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["comfortable-motion.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/comfortable-motion.vim"
  },
  ["completion-buffers"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/completion-buffers"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-tabnine"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/completion-tabnine"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  firenvim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/firenvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["julia-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/julia-vim"
  },
  ["latex-unicoder.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/latex-unicoder.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-snippets.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/telescope-snippets.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight-vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/tokyonight-vim"
  },
  undotree = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-ghost"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-ghost"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-headerguard"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-headerguard"
  },
  ["vim-lexical"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-lexical"
  },
  ["vim-litecorrect"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-litecorrect"
  },
  ["vim-markdown-jekyll"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-markdown-jekyll"
  },
  ["vim-pandoc"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax"
  },
  ["vim-pencil"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-pencil"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-stylishask"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-stylishask"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-svelte"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-svelte"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-table-mode"
  },
  ["vim-transparent"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-transparent"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType c ++once lua require("packer.load")({'vim-headerguard'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'vim-svelte'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown-jekyll'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmarkdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown-jekyll'}, { ft = "rmarkdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType julia ++once lua require("packer.load")({'julia-vim'}, { ft = "julia" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc ++once lua require("packer.load")({'vim-pandoc', 'vim-markdown-jekyll', 'vim-pandoc-syntax'}, { ft = "pandoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vimtex'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vim-headerguard'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-svelte/ftdetect/svelte.vim]]
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pandoc/ftdetect/pandoc.vim]]
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/julia-vim/ftdetect/julia.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
