execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'joshdick/onedark.vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'aperezdc/vim-template'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:email="mail@mail.com"
let g:username="mursalin"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""" Basic Behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
"set showmatch           " highlight matching parentheses / brackets [{()}]
set visualbell          " blink cursor on error, instead of beeping
set laststatus=2
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <F9> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=2
nnoremap <F8> :w <CR> :!clear && echo -e "\n------output------" && g++ -g -O2 -std=gnu++14 % -o %< && ./%< <CR>
let maplocalleader=" "
"""" Vim Appearance

"put colorscheme files in ~/.vim/colors/
colorscheme onedark                          " good colorschemes: murphy, slate, molokai, badwolf, solarized

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

syntax enable                               " use filetype-based syntax highlighting, ftplugins, and indentation

"""" Tab Settings

set tabstop=4           " number of spaces per <TAB>
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " set a <TAB> key-press equal to 4 spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')

"""" Search Settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"""" Misc Settings
set autoread           " autoreload the file in Vim if it has been changed outside of Vim

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for moreinformation.)
if (empty($TMUX))
  if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 <https://github.com/neovim/neovim/pull/2198 >
          let $NVIM_TUI_ENABLE_TRUE_COLOR=1
            endif
              "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
              "Based on Vim patch 7.4.1770 (`guicolors` option) https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd>
              " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
                    if (has("termguicolors"))
                        set termguicolors
                          endif
                          endif
