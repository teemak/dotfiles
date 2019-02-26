set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin('~/.vim/bundle')

Plugin 'vundlevim/vundle.vim'
Plugin 'scrooloose/nerdtree'                                                        
Plugin 'prettier/vim-prettier'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

set t_Co=256

colorscheme darkblue

" set foldmethod=indent
" set foldlevel=99
" nnoremap <space> za
" nnoremap <Esc> <Meta>

" ENTER ESCAPES INSERT MODE
inoremap <CR> <Esc>
 
set hlsearch
:hi Search guibg=LightBlue

set nu
set tabstop=4
set shiftwidth=4
set ai
set ff=unix
set cursorline
" <Space> after \|\<Space>
set list lcs=tab:\¦\ 
" set laststatus=2
set ruler
" set relativenumber

" removes autoindent on paste
" set paste

" PRETTIER
autocmd BufWritePre *.js PrettierAsync
let g:prettier#autoformat = 1
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 100
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'

nmap <C-n> :NERDTreeToggle<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='>'
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent loadview
augroup END
