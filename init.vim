
"start vim-plug
call plug#begin()
"some nice starter settings
Plug 'tpope/vim-sensible' 

"cool statusline
Plug 'vim-airline/vim-airline'

"minimal mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-two-firewatch'
Plug 'morhetz/gruvbox'

"auto completer
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
"file exlporer
Plug 'scrooloose/nerdtree'

call plug#end()

"visual stuff
"my terminal has true color support
set termguicolors

"set up color scheme
set background=dark
color gruvbox

"Auto complete settings (deoplete)
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"line numbers
set number

"soft tabbing
set expandtab shiftwidth=4 softtabstop=4 smarttab

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

"nice powerline symbols for airline
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"mappings
" Map the leader key to SPACE
let mapleader="\<SPACE>"

"shows when mid-command
set showcmd

" This allows buffers to be hidden if you've modified a buffer.
set hidden

"mappings
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader><Right> :bnext<CR>
nmap <leader><leader> :bnext<CR>

" Move to the previous buffer
nmap <leader><Left> :bprevious<CR>


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"use escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>

"toggle relative numbering
nnoremap <leader>r :call NumberToggle()<cr>

" use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Use ; for commands.
nnoremap ; :

"open Nerd tree
map <C-n> :NERDTreeToggle<CR>

"search stuff
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace, find and replace
nmap <Leader>s :%s//g<Left><Left>

"save folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"auto open nerdtree with 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
