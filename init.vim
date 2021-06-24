"  _____   _____   _____ 
" |_   _| | ___ \ /  ___|    I B Srinivas
"   | |   | |_/ / \ `--.     Github: IBS27
"   | |   | ___ \  `--. \    Twitter: @IBSrinivas
"  _| |_  | |_/ / /\__/ /
"  \___/  \____/  \____/
"        
" A customized init.vim for neovim (https://neovim.io/) 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Very Important settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
let g:mapleader=" "
let g:maplocalleader=','

filetype plugin indent on
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
autocmd FileType nerdtree setlocal nolist

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug for Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

"{{ Autocomplete LSP }}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"{{ Git }}
Plug 'airblade/vim-gitgutter'

"{{ Fuzzy find }}
Plug 'ctrlpvim/ctrlp.vim'

"{{ Code Commenter }}
Plug 'scrooloose/nerdcommenter'

"{{ Auto formatter }}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"{{ Tmux }}
Plug 'christoomey/vim-tmux-navigator'

"{{ Colorscheme }}
Plug 'dracula/vim', { 'as': 'dracula' }

"{{ Vim-airline statusbar }}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"{{ Syntax highlight }}
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'

"{{ HTML plugins }}
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

"{{ Dashboard }}
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"{{ NERDTree }}
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
            \ Plug 'PhilRunninger/nerdtree-visual-selection'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=UTF-8
set termguicolors
set noswapfile
set mouse=a
set number relativenumber
set smarttab
set autoindent
set cindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guifont=JetBrainsMono\ Nerd\ Font:h14
" set guifont=FuraCode\ Nerd\ Font\ Mono:h14
" set guifont=Delugia\ Nerd\ Font:h14
" set guifont=FiraCode\ Nerd\ Font\ Mono:h15
" set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h14
" set gfw=JetBrainsMono\ Nerd\ Font:h14

let g:neovide_refresh_rate=120
let g:neovide_cursor_animation_length=0.08
let g:neovide_cursor_trail_length=0.4
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_particle_lifetime=1.2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme Configuration [Dracula]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

colorscheme dracula

" Setting comments to be italic
highlight Comment cterm=italic gui=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dashboard Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dashboard_default_executive='telescope'

let g:dashboard_custom_section={
  \ 'a': {
    \ 'description': ['  Find File          '],
    \ 'command': 'Telescope find_files' },
  \ 'b': {
    \ 'description': ['  Recently Used Files'],
    \ 'command': 'Telescope oldfiles' },
  \ 'c': {
    \ 'description': ['  Load Last Session  '],
    \ 'command': 'SessionLoad' },
  \ 'd': {
    \ 'description': ['  Find Word          '],
    \ 'command': 'Telescope live_grep' },
  \ 'e': {
    \ 'description': ['  Settings           '],
    \ 'command': ':e ~/.config/nvim/init.vim' }
  \ }

let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
END

let g:dashboard_custom_footer = [
  \ '   _____ ._____________  _________      .__       .__                      ',
  \ '  / ___ \|   \______   \/   _____/______|__| ____ |__|__  _______    ______',
  \ ' / / ._\ \   ||    |  _/\_____  \\_  __ \  |/    \|  \  \/ /\__  \  /  ___/',
  \ '<  \_____/   ||    |   \/        \|  | \/  |   |  \  |\   /  / __ \_\___ \ ',
  \ ' \_____\ |___||______  /_______  /|__|  |__|___|  /__| \_/  (____  /____  >',
  \ '                     \/        \/               \/               \/     \/ '
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Function to make sure NERDTree doesn't open in dashboard
function DashboardCheck()
  if argc() == 0 | NERDTreeClose | endif
endfunction

autocmd VimEnter * call DashboardCheck()

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" let NERDTreeMinimalUI=1

" Key mappings
nmap <leader>e :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFocus<CR>

" Git colors
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'*',
                \ 'Staged'    :'+',
                \ 'Untracked' :'u',
                \ 'Renamed'   :'r',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'d',
                \ 'Dirty'     :'x',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'c',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeColorMapCustom = {
  \ "Staged"    : "#0ee375",  
  \ "Modified"  : "#d9bf91",  
  \ "Renamed"   : "#51C9FC",  
  \ "Untracked" : "#FCE77C",  
  \ "Unmerged"  : "#FC51E6",  
  \ "Dirty"     : "#FFBD61",  
  \ "Clean"     : "#87939A",   
  \ "Ignored"   : "#808080"   
  \ } 

let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '◢'

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
  NERDTreeFind
  wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigating tabs
nnoremap L gt
nnoremap H gT

" Shift+enter for new line in brackets with proper indentation
imap <S-CR> <CR><Esc>O

" Code commenter
vmap <leader>/ <plug>NERDCommenterToggle
nmap <leader>/ <plug>NERDCommenterToggle
let NERDSpaceDelims=1

" Function key remaps
" terminal opener
map <F12> :let $VIM_DIR=expand('%:p:h')<CR>:belowright split term://zsh<CR>:resize 15<CR>cd $VIM_DIR<CR>

" C/C++ compiling
nmap <F8> :w <CR> :!gcc % -o %< <CR>
nmap <F7> :w <CR> :!g++ -std=c++20 % -o %< <CR>

" Python runner
nmap <F5> :CocCommand python.execInTerminal <CR> 

" Format and save
nmap <C-s> :Format<CR> :w<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" To make <Esc> enter normal mode in neovim terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
endif

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" keymap to remove the annoying search highlight
nmap <silent> <leader>h :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HTML Tags configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ 'typescriptreact': 'jsxRegion,tsxRegion',
  \ 'javascriptreact': 'jsxRegion',
  \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-polyglot Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" python
let g:python_highlight_space_errors=0
let g:python_highlight_indent_errors=0
" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline statusbar Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#left_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier Code Formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 0
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#arrow_parens = 'avoid'

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html, PrettierAsync

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp Fuzzy Finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conqueror of Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-pydocstring',
  \ 'coc-clangd',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-htmldjango',
  \ 'coc-html-css-support',
  \ 'coc-jedi',
  \ 'coc-yaml',
  \ 'coc-browser'
  \ ]

set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_nfo()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType javascript,typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>Ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>Ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>Cc  :<C-u>CocList commands<cr>
" Find symbol of current dCocument
nnoremap <silent> <leader>Co  :<C-u>CocList outline<cr>
" Search workleader symbolCs
nnoremap <silent> <leader>Cs  :<C-u>CocList -I symbols<cr>
" Do default action for neCxt item.
nnoremap <silent> <leader>Cj  :<C-u>CocNext<CR>
" Do default action for prCevious item.
nnoremap <silent> <leader>Ck  :<C-u>CocPrev<CR>
" Resume latest coc listv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Removing the vim default status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar

