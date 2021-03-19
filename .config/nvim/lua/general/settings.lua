local o = vim.o
local wo = vim.wo
local bo = vim.bo

--- Global

o.hidden = true                                                 -- Abandoning buffer does not unload it
o.encoding = 'utf-8'                                            -- Use UTF-8 encoding
o.pumheight = 10                                                -- Pop Up Menu height is 10 lines
o.mouse = 'a'                                                   -- Hey sometimes it is more intuitive
o.splitbelow = true                                             -- Would be pretty annoying if it kept opening up top
o.splitright = true                                             -- Also annoying if it opened left
o.termguicolors = true                                          -- Give me all the colors!
o.laststatus = 2                                                -- Show me that beautiful statusline
o.background = 'dark'                                           -- Keep dark if it ain't transparent
o.whichwrap = o.whichwrap..'<,>,h,l,[,]'                        -- Wrap the cursor around
o.showmode = false                                              -- Statusline plugin can handle that
o.ruler = false                                                 -- Statusline plugin can also handle that
o.updatetime = 300                                              -- Faster completion
o.timeoutlen = 500                                              -- Faster timeout
o.clipboard = 'unnamedplus'                                     -- Use system clipboard
o.incsearch = true                                              -- Highlight search
o.hlsearch = true                                               -- Persist that highlight
o.undodir = vim.fn.getenv('HOME')..'/.local/share/nvim/undodir' -- Where to place undo files
o.virtualedit = 'onemore'                                       -- It feels better
o.modelines = 1                                                 -- For custom commands in the buffer
o.autoread = true                                               -- Autoread file changes
o.fillchars = 'eob: '                                           -- Transparent end of buffer chars
o.scrolloff = 8                                                 -- Keep this many lines above and below cursor
o.completeopt = 'menuone,noinsert,noselect'                     -- Better completion experience
o.guifont = 'InputMono Nerd Font:h14,DejaVu Sans Mono:h14'

--- Window

wo.conceallevel = 0      -- Don't hide things please
wo.number = true         -- Show the current line number
wo.relativenumber = true -- Show distance from current line
wo.cursorline = true     -- That line is important, the one the cursor is on
wo.wrap = false          -- Do not wrap the text, it's ugly
wo.signcolumn = 'auto:4' -- Gutter is visible only when required
wo.foldlevel = 99        -- Default to no folding

--- Buffer

bo.iskeyword = bo.iskeyword..',-' -- Dash seperated words are text objects
bo.fileencoding = 'utf-8'         -- UTF-8 encoding written to file
bo.expandtab = true               -- Tabs are actually spaces
bo.shiftwidth = 2                 -- This many spaces per tab
bo.softtabstop = 2                -- Again this many spaces per tab
bo.smartindent = true             -- Indent smart
bo.autoindent = true              -- Indent always
bo.undofile = true                -- Track those changes!

vim.cmd("filetype plugin on") -- For filetype plugins of course
