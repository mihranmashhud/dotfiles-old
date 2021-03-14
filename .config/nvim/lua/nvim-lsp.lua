local protocol = require'vim.lsp.protocol'
local util = require'lspconfig.util'
local on_attach = function(client, bufnr)
  print('LSP started.')

  local function nmap(keys, expr, options) 
    vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, expr, options or {})
  end
  local function vmap(keys, expr, options) 
    vim.api.nvim_buf_set_keymap(bufnr, 'v', keys, expr, options or {})
  end
  -- Labels
  protocol.SymbolKind = {
    '   File'; --File 
    '   Module'; --Module
    ' 凜 Namespace'; --Namespace
    '   Package'; --Package
    ' פּ  Class'; --Class
    '   Method'; --Method
    '   Property'; --Property 
    '   Field'; --Field
    '   Constructor'; --Constructor
    '   Enum'; --Enum 
    ' 蘒 Interface'; --Interface
    '   Function'; --Function
    '[] Variable'; --Variable
    '   Constant'; --Constant 
    '   Text'; --Text
    '   Value'; --Value 
    '   Boolean'; --Boolean 
    '   Array'; --Array 
    '   Object'; --Object 
    '   Key'; --Key 
    ' ﳠ  Null'; --Null 
    '   Enum member'; --EnumMember 
    '   Struct'; --Struct 
    '   Event'; --Event 
    '   Operator'; --Operator 
    '<> Typeparam'; --TypeParameter
  }
  protocol.CompletionItemKind = {
    '   Text'; --Text
    '   Method'; --Method
    '   Function'; --Function
    '   Constructor'; --Constructor
    '   Field'; --Field
    '[] Variable'; --Variable
    ' פּ  Class'; --Class
    ' 蘒 Interface'; --Interface
    '   Module'; --Module
    '   Property'; --Property 
    ' 塞 Unit'; --Unit 
    '   Value'; --Value 
    ' 練 Enum'; --Enum 
    '   Keyword'; --Keyword 
    '   Snippet'; --Snippet 
    '   Color'; --Color 
    '   File'; --File 
    '   Reference'; --Reference 
    '   Folder'; --Folder 
    '   Enum member'; --EnumMember 
    '   Constant'; --Constant 
    '   Struct'; --Struct 
    '   Event'; --Event 
    '   Operator'; --Operator 
    '<> Typeparam'; --TypeParameter
  }

  -- Mappings
  local opts = { noremap=true, silent=true }
  nmap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  nmap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  nmap('gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  nmap('gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  nmap('gs', '<Cmd>lua vim.lsp.buf.signature_help()', opts)
  nmap('K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  nmap('gh', '<Cmd>lua require"lspsaga.provider".lsp_finder()<CR>', opts)
  nmap('[d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  nmap(']d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- Leader mappings
  nmap('<leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  nmap('<leader>le', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  nmap('<leader>la', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
  vmap('<leader>la', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    nmap('<space>lF', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    nmap('<space>lF', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end
end

local lspconfig = require'lspconfig'
-- General LS - EFM
lspconfig.efm.setup{on_attach = on_attach}

-- Python
lspconfig.pyright.setup{on_attach = on_attach}

-- Vim
lspconfig.vimls.setup{on_attach = on_attach}

-- C++
lspconfig.ccls.setup{
  init_options = {
	  compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  },
  on_attach = on_attach,
}

-- Typescript
lspconfig.tsserver.setup{on_attach = on_attach}

-- Julia
lspconfig.julials.setup{
    on_new_config = function(new_config,new_root_dir)
      server_path = "/home/mihranmashhud/.julia/packages/LanguageServer/y1ebo/src"
      cmd = {
        "julia",
        "--project="..server_path,
        "--startup-file=no",
        "--history-file=no",
        "-e", [[
          using Pkg;
          Pkg.instantiate()
          using LanguageServer; using SymbolServer;
          depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
          project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
          # Make sure that we only load packages from this environment specifically.
          @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
          server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
          server.runlinter = true;
          run(server);
        ]]
      };
      new_config.cmd = cmd
    end,
    on_attach = on_attach,
}

-- Haskell
lspconfig.hls.setup{on_attach = on_attach}

-- Svelte
lspconfig.svelte.setup{on_attach = on_attach}

-- Lua
local sumneko_linux_bin = false
local sumneko_linux_root = false
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
  sumneko_linux_bin = "/usr/bin/lua-language-server"
  sumneko_linux_root = "/usr/share/lua-language-server"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = sumneko_linux_root or vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_linux_bin or sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  root_dir = function(fname)
    return util.find_git_ancestor(fname) or util.path.dirname(fname)
  end,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = on_attach,
}
