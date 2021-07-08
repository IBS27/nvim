"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Very Important settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mapleader=" " " Map leader key
set nocompatible

filetype plugin indent on
autocmd TermOpen * setlocal nonumber norelativenumber nocursorline " disable line numbers and cursorline in embedded terminal
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " stop newline continuation of comments
autocmd BufWritePre * %s/\s\+$//e " remove trailing spaces in a file on save

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                               " Enables syntax highlighing
set encoding=UTF-8                      " The encoding displayed
set showtabline=2                       " Always show tabline
set noswapfile                          " Necessary for live-server to work
set smartcase                           " Smart casing while searching in vim
set mouse=a                             " Enable your mouse
set nowrap                              " Display long lines as just one line
set pumheight=10                        " Makes popup menu smaller
set fileencoding=UTF-8                  " The encoding written to file
set iskeyword+=-                      	" treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set tabstop=4                           " Insert 2 spaces for a tab
set softtabstop=4                       " Takes care of tab sizes
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set cindent                             " Good for C/C++
set laststatus=0                        " Always display the status line
set number relativenumber               " Relative Line numbers
set background=dark                     " tell vim what the background color looks like
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set noshowcmd                           " to get rid of display of last command
set shortmess+=F                        " to get rid of the file name displayed in the command line bar
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set cursorline                          " A line for showing where the cursor is
set cmdheight=2                         " More space in neovim command line
set pumheight=10                        " Pop-up height menu
set t_Co=256
set t_ut=

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
