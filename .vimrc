set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vundlevim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'leafgarland/typescript-vim'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set rtp+=$HOME/.vim/bundle/ctrlp.vim

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
   endif
endif

set t_Co=256
set encoding=UTF-8

colorscheme grb256
" colorscheme railscasts
" colorscheme darkblue

" set foldmethod=indent
" set foldlevel=99
" nnoremap <space> za
" nnoremap <Esc> <Meta>

" ENTER ESCAPES INSERT MODE
inoremap <CR> <Esc>

set hlsearch
:hi Search guibg=LightBlue
set guifont=DejaVu\ Sans:s12

syntax on
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

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" PRETTIER
autocmd BufWritePre *.js,*.ts PrettierAsync
let g:prettier#autoformat = 1
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 100
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'

" NERDTREE
nmap <C-n> :NERDTreeToggle<cr>
let g:NERDTreeNodeDelimiter = "\u00a0"
"let g:NERDTreeNodeDelimiter = " "
" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='>'
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

" SAVE FOLDS
augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent loadview
augroup END

" FUZZY FINDER
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
