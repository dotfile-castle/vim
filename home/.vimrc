:set background&
                   
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'      
Plug 'vim-airline'             
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'  
Plug 'kien/ctrlp.vim'          
Plug 'tpope/vim-fugitive'      
Plug 'scrooloose/syntastic'    
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()                
    
" get rid of the default mode indicator
"set noshowmode

" Resolve: vim-airline doesn't appear until I create a new split
set laststatus=2

let NERDTreeShowHidden=1
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Disable line number by default
set nonumber

" Make searching less sucky
set hlsearch
set ignorecase
set smartcase

" Shows all open buffers and their number
nnoremap <F5> :buffers<CR>:buffer<Space>

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine why not use it
if has('mouse')
  set mouse=a
endif

" Function to trim trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l,c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
