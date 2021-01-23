call plug#begin('~/.vim/plugged')

"--------------------------------------------
"=>  C O L O R S C H E M E    P L U G S
"--------------------------------------------
Plug 'flrnprz/plastic.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/edge'


"--------------------------------------------
"=>  P L U G I N S
"--------------------------------------------
" A low-configuration buffer list that lives in the tabline
Plug 'ap/vim-buftabline'

" Status line
Plug 'vim-airline/vim-airline'

" Auto pair \{ \[
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'


"--------------------------------------------
"=>  O T H E R   P L U G I N S
"--------------------------------------------
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh',}
Plug 'junegunn/fzf'
Plug 'sainnhe/edge'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'


call plug#end()
"------------------------------------------
"=>  S E T T I N G S
"------------------------------------------
syntax on
set hidden
set number                   " Show line numbers
set hlsearch                 " Highlight matches in search
set ruler                    " Show line and column number
set formatoptions=1          " Don't wrap text after a one-letter word
set linebreak                " Break lines when appropriate
set incsearch                " Find as you type
set softtabstop=4            " Set the number of columns for tab
set expandtab                " Expand tabs to spaces
set noerrorbells             " No beeps
set showcmd                  " Show me what I'm typing
set termguicolors
set showtabline=2            " Show the tab bar all the time

colorscheme onedark          " Set colorscheme

let g:mapleader=','
let g:edge_style = 'default'
let g:edge_disable_italic_comment = 1
let g:edge_transparent_background = 1 " 1 means it can be transparent
let g:indentLine_char = '|'

" Set background color to transperent
execute "hi Normal guibg=NONE ctermbg=NONE"  
"-------------------------------------------
"=>  LIGHTLINE THEME 
"-------------------------------------------
"let g:lightline = { 'colorscheme': 'plastic' }
let g:lightline = {'colorscheme' : 'onedark'}


"-------------------------------------------
"=>  M A P P I N G S
"-------------------------------------------

"Initialising an alt-key
execute "set <M-d>=\ed"

"execute "set <M-h>=\eh"
"execute "set <M-j>=\ej"
"execute "set <M-k>=\ek"
"execute "set <M-l>=\el"

execute "set <M-w>=\ew"
execute "set <M-W>=\eW"
execute "set <M-t>=\et"
execute "set <M-y>=\ey"
execute "set <M-o>=\eo"
"----------------------


"[Alt+n] Open file explorer
noremap <M-d> :NERDTreeToggle<CR>

"[Alt+h] Select window
nnoremap <M-h> <C-w>h
"[Alt+j] Select window
nnoremap <M-j> <C-w>j
"[Alt+k] Select window
nnoremap <M-k> <C-w>k
"[Alt+l] Select window
nnoremap <M-l> <C-w>l                       

"[Alt+w] Closes a window but keeps the buffer
nnoremap <M-w> <C-w>c                       

"[Alt+t] Opens terminal next to editor
noremap <M-t> :below terminal<CR>

"[Alt+y] Choses next buffer
nnoremap <M-y> :bnext<CR>
"[Alt+o] Choses previous buffer
nnoremap <M-o> :bprev<CR>

"[Alt+d] Closes the current buffer
nnoremap <M-W> :bd<CR>


"Running scripts
"[python]
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"[sh]
autocmd FileType sh map <buffer> <F5> :w<CR>:exec '!./%' shellescape(@%, 1)<CR>

"-------------------------------------------
