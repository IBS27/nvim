"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fuzzy finder
nnoremap <C-p> :Telescope find_files<CR>

" pasting using Cmd + v in neovide on mac
imap <D-v> <Esc>"+p<CR>i
nmap <D-v> "+p<CR>

" shift+enter for automatic indent in brackets
" imap <S-CR> <CR><Esc>O

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

" moving lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
