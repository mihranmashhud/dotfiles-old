--- Global

vim.o.hidden = true                                                 -- Abandoning buffer does not unload it
vim.o.encoding = 'utf-8'                                            -- Use UTF-8 encoding
vim.o.pumheight = 10                                                -- Pop Up Menu height is 10 lines
vim.o.mouse = 'a'                                                   -- Hey sometimes it is more intuitive
vim.o.splitbelow = true                                             -- Would be pretty annoying if it kept opening up top
vim.o.splitright = true                                             -- Also annoying if it opened left
vim.o.termguicolors = true                                          -- Give me all the colors!
vim.o.laststatus = 2                                                -- Show me that beautiful statusline
vim.o.background = 'dark'                                           -- Keep dark if it ain't transparent
vim.o.whichwrap = vim.o.whichwrap..'<,>,h,l,[,]'                        -- Wrap the cursor around
vim.o.showmode = false                                              -- Statusline plugin can handle that
vim.o.ruler = false                                                 -- Statusline plugin can also handle that
vim.o.updatetime = 300                                              -- Faster completion
vim.o.timeoutlen = 500                                              -- Faster timeout
vim.o.clipboard = 'unnamedplus'                                     -- Use system clipboard
vim.o.incsearch = true                                              -- Highlight search
vim.o.hlsearch = true                                               -- Persist that highlight
vim.o.undodir = vim.fn.getenv('HOME')..'/.local/share/nvim/undodir' -- Where to place undo files
vim.o.virtualedit = 'onemore'                                       -- It feels better
vim.o.modelines = 1                                                 -- For custom commands in the buffer
vim.o.autoread = true                                               -- Autoread file changes
vim.o.fillchars = 'eob: '                                           -- Transparent end of buffer chars
vim.o.scrolloff = 8                                                 -- Keep this many lines above and below cursor
vim.o.completeopt = 'menuone,noinsert,noselect'                     -- Better completion experience
vim.o.guifont = 'InputMono Nerd Font:h14'
vim.o.linespace = 1

--- Window

vim.wo.conceallevel = 0      -- Don't hide things please
vim.wo.number = true         -- Show the current line number
vim.wo.relativenumber = true -- Show distance from current line
vim.wo.cursorline = true     -- That line is important, the one the cursor is on
vim.wo.wrap = false          -- Do not wrap the text, it's ugly
vim.wo.signcolumn = 'auto:4' -- Gutter is visible only when required
vim.wo.foldlevel = 99        -- Default to no folding

--- Buffer

vim.bo.iskeyword = vim.bo.iskeyword..',-' -- Dash seperated words are text objects
vim.bo.fileencoding = 'utf-8'         -- UTF-8 encoding written to file
vim.bo.shiftwidth = 2                 -- This many spaces per tab
vim.bo.softtabstop = 2                -- Again this many spaces per tab
vim.bo.tabstop = 2                    -- Really use 2 spaces okay?
vim.bo.expandtab = true               -- Tabs are actually spaces
vim.bo.autoindent = true              -- Indent always
vim.bo.undofile = true                -- Track those changes!

vim.cmd("filetype plugin on") -- For filetype plugins of course
