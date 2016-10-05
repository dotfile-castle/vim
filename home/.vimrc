set t_Co=256
:set background&

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
call plug#end()

" NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree will ignore file that match regular expression
let NERDTreeIgnore = ['\.swp','\.pyc$']

" NERDTree will show hidden files
let NERDTreeShowHidden=1

" automatically populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Straight tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" airline theme
let g:airline_theme='serene'

" get rid of mode indicator (redudent with airline)
set noshowmode

" Resolve: vim-airline doesn't appear until I create a new split
set laststatus=2

" Enable spellcheck
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=undercurl

" Disable line number by default
set nonumber

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

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

" for tmux to automatically set paste and nopaste mode at the time pasting (as happens in VIM UI)

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
