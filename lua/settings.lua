local cmd = vim.cmd
local opt = vim.opt

cmd "filetype plugin indent on" -- add ability to add filetype settings
cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o" -- disable newline continuation of comments
cmd "autocmd BufWritePre * %s/\\s\\+$//e" -- remove trailing spaces in a file on save

opt.shortmess:append "c" -- don't give ins-completion-menu messages
opt.shortmess:append "F" -- to get rid of the file name displayed in the command line bar
opt.iskeyword:append "-" -- treat dash separated words as a word text object

opt.encoding = "UTF-8" -- The encoding displayed
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
opt.swapfile = false -- Necessary for live-server to work
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hidden = true -- required to keep multiple buffers and open multiple buffers
opt.hlsearch = false -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.smartcase = true -- smart case
opt.autoindent = true -- Good auto indent
opt.smartindent = true -- make indenting smarter again
opt.cindent = true -- Good for C/C++
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300 -- faster completion
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.softtabstop = 4 -- better indenting
opt.tabstop = 4 -- insert 2 spaces for a tab
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
