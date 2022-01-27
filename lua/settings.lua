local cmd = vim.cmd
local opt = vim.opt

cmd "filetype plugin indent on" -- add ability to add filetype settings
-- cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o" -- disable newline continuation of comments
cmd "autocmd BufWritePre * %s/\\s\\+$//e" -- remove trailing spaces in a file on save

cmd "autocmd FileType htmldjango setlocal filetype=html" -- TODO: Find LSP for django

-- Cleaner dashboard look
cmd "autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= "
cmd "autocmd FileType dashboard set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2"
cmd "autocmd FileType dashboard nnoremap <silent> <buffer> q :q<CR>"

opt.shortmess:append "c" -- don't give ins-completion-menu messages
opt.shortmess:append "F" -- to get rid of the file name displayed in the command line bar
opt.iskeyword:append "-" -- treat dash separated words as a word text object

opt.encoding = "UTF-8" -- The encoding displayed
opt.clipboard = "unnamedplus" -- allows neovim to access system clipboard
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
opt.showcmd = false -- previous command is hidden
opt.showtabline = 2 -- always show tabs
opt.smartcase = true -- smart case
opt.autoindent = true -- Good auto indent
opt.smartindent = true -- make indenting smarter again
opt.cindent = true -- Good for C/C++
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- doesn't create a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300 -- faster completion
opt.completeopt = { "menu", "menuone", "noselect" } -- Required for autocomplete
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.softtabstop = 4 -- better indenting
opt.tabstop = 4 -- insert 4 spaces for a tab
opt.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.timeoutlen = 150 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 30 -- Faster completion
opt.hlsearch = true -- Highlight search result
opt.colorcolumn = "99999" -- To fix cursorline issue

vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" } -- quickscope

-- Colorscheme
vim.cmd "colorscheme sonokai"

-- Disable most built-in plugins
function Disable_distribution_plugins()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
end

Disable_distribution_plugins()

-- Sneak settings
-- TODO: Find a better place to put this
cmd "let g:sneak#label = 1"
cmd "let g:sneak#use_ic_scs = 1"
cmd "let g:sneak#s_next = 1"
cmd "map gS <Plug>Sneak_,"
cmd "map gs <Plug>Sneak_;"
-- cmd let g:sneak#prompt = '🕵'
cmd "let g:sneak#prompt = '🔎 '"
