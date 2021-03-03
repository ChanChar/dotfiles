set nocompatible " be iMproved, required
set number
set incsearch " search as characters are entered
set ruler " shows column numbers
set hlsearch " highlight matches
set backspace=indent,eol,start " Removes any trailing white spaces for whitelisted file types.
set expandtab
set shiftwidth=2
set tabstop=2
set background=dark
set t_Co=256

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let mapleader=" "

colorscheme molokai

filetype off " required

syntax on

autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e " Makes backspace function as one would expect.

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source ~/.vimrc | endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomasr/molokai'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-editors/vim-elixir'

" Initialize plugin system
call plug#end()

filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Custom key mappings
inoremap jk <esc> " Remap esc to jk
