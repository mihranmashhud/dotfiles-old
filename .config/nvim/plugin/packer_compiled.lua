-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mihranmashhud/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
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
  ["compe-latex-symbols"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/compe-latex-symbols"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/compe-tabnine"
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
  kommentary = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["latex-unicoder.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/latex-unicoder.vim"
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
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-dap-python"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
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
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
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
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
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
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-lexical"
  },
  ["vim-litecorrect"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-litecorrect"
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
    loaded = false,
    needs_bufread = false,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pencil"
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
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-transparent"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vim-transparent"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/mihranmashhud/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rmarkdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown-jekyll'}, { ft = "rmarkdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType julia ++once lua require("packer.load")({'julia-vim'}, { ft = "julia" }, _G.packer_plugins)]]
vim.cmd [[au FileType mkd ++once lua require("packer.load")({'vim-table-mode', 'vim-lexical', 'vim-litecorrect', 'latex-unicoder.vim', 'vim-pencil'}, { ft = "mkd" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc ++once lua require("packer.load")({'vim-table-mode', 'vim-lexical', 'vim-litecorrect', 'latex-unicoder.vim', 'vim-pandoc', 'vim-markdown-jekyll', 'vim-pandoc-syntax', 'vim-pencil'}, { ft = "pandoc" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'vim-headerguard'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vim-table-mode', 'vim-lexical', 'vim-litecorrect', 'vimtex', 'latex-unicoder.vim', 'vim-pencil'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'vim-svelte'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vim-headerguard'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-lexical', 'vim-litecorrect', 'latex-unicoder.vim', 'markdown-preview.nvim', 'vim-markdown-jekyll', 'vim-pencil'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-svelte/ftdetect/svelte.vim]], true)
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-svelte/ftdetect/svelte.vim]]
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-svelte/ftdetect/svelte.vim]], false)
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/julia-vim/ftdetect/julia.vim]], true)
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/julia-vim/ftdetect/julia.vim]]
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/julia-vim/ftdetect/julia.vim]], false)
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pandoc/ftdetect/pandoc.vim]], true)
vim.cmd [[source /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pandoc/ftdetect/pandoc.vim]]
time([[Sourcing ftdetect script at: /home/mihranmashhud/.local/share/nvim/site/pack/packer/opt/vim-pandoc/ftdetect/pandoc.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
