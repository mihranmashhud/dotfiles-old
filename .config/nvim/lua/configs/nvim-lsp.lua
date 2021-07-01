local lspconfig = require'lspconfig'
local protocol = require'vim.lsp.protocol'
local util = require'lspconfig.util'
local map_utils = require'utils.map'
local autocmd = require'utils.autocmd'.autocmd
local bind_func = map_utils.buf_bind_function
local set_group_name = require('utils.map').set_group_name
local dirname = util.path.dirname

-- Labels
protocol.SymbolKind = {
  '   File';        -- File
  '   Module';      -- Module
  ' 凜 Namespace';   -- Namespace
  '   Package';     -- Package
  '   Class';       -- Class
  '   Method';      -- Method
  '   Property';    -- Property
  '   Field';       -- Field
  '   Constructor'; -- Constructor
  '   Enum';        -- Enum
  ' 蘒 Interface';   -- Interface
  '   Function';    -- Function
  '[] Variable';    -- Variable
  '   Constant';    -- Constant
  '   Text';        -- Text
  '   Value';       -- Value
  '   Boolean';     -- Boolean
  '   Array';       -- Array
  '   Object';      -- Object
  '   Key';         -- Key
  ' ﳠ  Null';        -- Null
  '   Enum member'; -- EnumMember
  '   Struct';      -- Struct
  '   Event';       -- Event
  '   Operator';    -- Operator
  '<> Typeparam';   -- TypeParameter
}
protocol.CompletionItemKind = {
  '   Text';        -- Text
  '   Method';      -- Method
  '   Function';    -- Function
  '   Constructor'; -- Constructor
  '   Field';       -- Field
  '[] Variable';    -- Variable
  '   Class';       -- Class
  ' 蘒 Interface';   -- Interface
  '   Module';      -- Module
  '   Property';    -- Property
  ' 塞 Unit';        -- Unit
  '   Value';       -- Value
  ' 練 Enum';        -- Enum
  '   Keyword';     -- Keyword
  '   Snippet';     -- Snippet
  '   Color';       -- Color
  '   File';        -- File
  '   Reference';   -- Reference
  '   Folder';      -- Folder
  '   Enum member'; -- EnumMember
  '   Constant';    -- Constant
  '   Struct';      -- Struct
  '   Event';       -- Event
  '   Operator';    -- Operator
  '<> Typeparam';   -- TypeParameter
}


local on_attach = function(client, bufnr)
  print('LSP started.')

  local function nmap(keys, func, options, name)
    bind_func(bufnr, 'n', keys, func, options, name)
  end
  local function vmap(keys, func, options, name)
    bind_func(bufnr, 'v', keys, func, options, name)
  end
  -- Mappings
  local opts = { noremap=true, silent=true }
  nmap('gd', vim.lsp.buf.definition, opts, 'Go to definition')
  nmap('gD', vim.lsp.buf.declaration, opts, 'Go to declaration')
  nmap('gr', vim.lsp.buf.references, opts, 'Go to references')
  nmap('gi', vim.lsp.buf.implementation, opts, 'Go to implementation')
  nmap('gs', vim.lsp.buf.signature_help, opts, 'Show signature help')
  nmap('K', vim.lsp.buf.hover, opts, 'Hover doc')
  nmap('gh', require"lspsaga.provider".lsp_finder, opts, 'Show definitions & references')
  nmap(']d', vim.lsp.diagnostic.goto_next, opts, 'Prev diagnostic')
  nmap('[d', vim.lsp.diagnostic.goto_prev, opts, 'Next diagnostic')
  -- Leader mappings
  set_group_name('<leader>l', 'LSP')
  nmap('<leader>lr', vim.lsp.buf.rename, opts, 'Rename')
  nmap('<leader>le', vim.lsp.diagnostic.show_line_diagnostics, opts, 'View line diagnostics')
  nmap('<leader>la', require("lspsaga.codeaction").code_action, opts, 'View code actions')
  vmap('<leader>la', require("lspsaga.codeaction").range_code_action, opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    nmap('<space>lF', vim.lsp.buf.formatting, opts)
  elseif client.resolved_capabilities.document_range_formatting then
    nmap('<space>lF', vim.lsp.buf.range_formatting, opts)
  end

  -- Format on save

end


-- Diagnostics

autocmd('ColorScheme * :lua require("vim.lsp.diagnostic")._define_default_signs_and_highlights()') -- So diagnostics have color
local orig_set_signs = vim.lsp.diagnostic.set_signs
local set_signs_limited = function(diagnostics,  bufnr, client_id, sign_ns, opts)
  opts = opts or {}
  opts.serverity_limit = "Warning"
  orig_set_signs(diagnostics, bufnr, client_id, sign_ns, opts)
end
vim.lsp.diagnostic.set_signs = set_signs_limited
do
  local handler = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
  }
)
  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, result, client_id, bufnr, config)
    handler(err, method, result, client_id, bufnr, config)
    local diagnostics = vim.lsp.diagnostic.get(bufnr)
    local loclist = {}
      for _, d in ipairs(diagnostics) do
        d.bufnr = bufnr
        d.lnum = d.range.start.line + 1
        d.col = d.range.start.character + 1
        d.text = d.message
        table.insert(loclist, d)
      end
    vim.lsp.util.set_loclist(loclist)
  end
end

-- General LS - EFM
local eslint = {
  lintCommand = 'npx eslint -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
  formatCommand = 'npx eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}
local prettier = {
  formatCommand = "npx prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}
lspconfig.efm.setup{
  on_attach = on_attach,
  filetypes = { "lua", "javascript", "typescriptreact", "typescript"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      javascript = {
        prettier,
      },
      typescriptreact = {
        prettier,
      },
      typescript = {
        prettier,
      },
    }
  }
}
-- Python
lspconfig.pyright.setup{
  on_attach = on_attach,
}
-- Vim
lspconfig.vimls.setup{on_attach = on_attach}

-- C++
lspconfig.ccls.setup{
  on_attach = on_attach,
  compilationDatabaseDirectory = "build";
  root_dir = function (fname)
    return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", ".ccls")(fname) or dirname(fname)
  end
}

-- Typescript
lspconfig.tsserver.setup{
  on_attach = on_attach,
}

-- Julia
lspconfig.julials.setup{
    on_new_config = function(new_config,_)
      local server_path = "/home/mihranmashhud/.julia/packages/LanguageServer/y1ebo/src"
      local cmd = {
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
          [os.getenv('HOME')..'/.config/nvim/lua'] = true,
        },
      },
    },
  },
  on_attach = on_attach,
}

-- Ruby
require'lspconfig'.solargraph.setup {on_attach = on_attach}
