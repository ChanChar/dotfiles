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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let mapleader=" "

colorscheme molokai

filetype off " required

syntax on

autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e " Makes backspace function as one would expect.

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elixir-editors/vim-elixir'

call vundle#end()            " required

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


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
