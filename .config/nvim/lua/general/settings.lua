--- Global

vim.opt.hidden = true                                                  -- Abandoning buffer does not unload it
vim.opt.encoding = 'utf-8'                                             -- Use UTF-8 encoding
vim.opt.pumheight = 10                                                 -- Pop Up Menu height is 10 lines
vim.opt.mouse = 'a'                                                    -- Hey sometimes it is more intuitive
vim.opt.splitbelow = true                                              -- Would be pretty annoying if it kept opening up top
vim.opt.splitright = true                                              -- Also annoying if it opened left
vim.opt.termguicolors = true                                           -- Give me all the colors!
vim.opt.laststatus = 2                                                 -- Show me that beautiful statusline
vim.opt.background = 'dark'                                            -- Keep dark if it ain't transparent
vim.opt.whichwrap = '<,>,h,l,[,]'-- Wrap the cursor around
vim.opt.showmode = false                                               -- Statusline plugin can handle that
vim.opt.ruler = false                                                  -- Statusline plugin can also handle that
vim.opt.updatetime = 300                                               -- Faster completion
vim.opt.timeoutlen = 500                                               -- Faster timeout
vim.opt.clipboard = 'unnamedplus'                                      -- Use system clipboard
vim.opt.incsearch = true                                               -- Highlight search
vim.opt.hlsearch = true                                                -- Persist that highlight
vim.opt.undodir = vim.fn.getenv('HOME')..'/.local/share/nvim/undodir'  -- Where to place undo files
vim.opt.virtualedit = 'onemore'                                        -- It feels better
vim.opt.modelines = 1                                                  -- For custom commands in the buffer
vim.opt.autoread = true                                                -- Autoread file changes
vim.opt.fillchars = { eob = ' ' }                                      -- Transparent end of buffer chars
vim.opt.scrolloff = 8                                                  -- Keep this many lines above and below cursor
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }            -- Better completion experience
vim.opt.guifont = 'InputMono Nerd Font:h14'                            -- Font
vim.opt.linespace = 1                                                  --
vim.opt.modelines = 1                                                  --
vim.opt.conceallevel = 0                                               -- Don't conceal things please
vim.opt.number = true                                                  -- Show the current line number
vim.opt.relativenumber = true                                          -- Show distance from current line
vim.opt.cursorline = true                                              -- That line is important, the one the cursor is on
vim.opt.wrap = false                                                   -- Do not wrap the text, it's ugly
vim.opt.signcolumn = 'auto:4'                                          -- Gutter is visible only when required
vim.opt.foldlevel = 99                                                 -- Default to no folding
vim.opt.iskeyword = vim.opt.iskeyword + { '-' }                        -- Dash seperated words are text objects
vim.opt.fileencoding = 'utf-8'                                         -- UTF-8 encoding written to file
vim.opt.shiftwidth = 2                                                 -- This many spaces per tab
vim.opt.softtabstop = 2                                                -- Again this many spaces per tab
vim.opt.tabstop = 2                                                    -- Really use 2 spaces okay?
vim.opt.expandtab = true                                               -- Tabs are actually spaces
vim.opt.autoindent = true                                              -- Indent always
vim.opt.undofile = true                                                -- Track those changes!

vim.cmd("filetype plugin on") -- For filetype plugins of course
