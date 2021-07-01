-- local dap = require'dap'
vim.g.dap_virtual_text = true

-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
-- }
-- dap.configurations.javascript = {
--   {
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
-- }
