"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" pasting using Cmd + v in neovide on mac
imap <D-v> <Esc>"+p<CR>i
nmap <D-v> "+p<CR>

" Navigating tabs
nnoremap L gt
nnoremap H gT

" Code commenter
vmap <leader>/ <plug>NERDCommenterToggle
nmap <leader>/ <plug>NERDCommenterToggle
let NERDSpaceDelims=1

" Function key remaps
" Open Terminal
map <F12> :let $VIM_DIR=expand('%:p:h')<CR>:belowright split term://zsh<CR>:resize 15<CR>cd $VIM_DIR<CR>

" C/C++ compiling
nmap <F8> :w <CR> :!gcc % -o %< <CR>
nmap <F7> :w <CR> :!g++ -std=c++20 % -o %< <CR>

" Run python
nmap <F5> :CocCommand python.execInTerminal<CR>

" Format and save
nmap <C-s> :Format<CR> :w<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" keymap to remove the annoying search highlight
nmap <silent> <leader>h :set hlsearch!<CR>

" moving lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better nav for autocomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" Reloading tree-sitter highlight
nmap <leader>R :w<CR> :e<CR> :TSBufEnable highlight<CR>
