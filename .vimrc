" vim configuration
"====================

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugins
"--------------------
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Cargo crates
Plugin 'nonius/cargo.vim'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Mardown Previews
" * Also run `sudo npm -g install instant-markdown-d`
Plugin 'suan/vim-instant-markdown'

" NERD Commenter
Plugin 'scrooloose/nerdcommenter'

" NERD Tree
Plugin 'scrooloose/nerdtree'

" Python Mode
Plugin 'klen/python-mode'

" Racer
Plugin 'racer-rust/vim-racer'

" Rust
Plugin 'rust-lang/rust.vim'

" Sensible
Plugin 'tpope/vim-sensible'

" SuperTab
Plugin 'ervandew/supertab'

" Surround
Plugin 'tpope/vim-surround'

" Syntastic
Plugin 'scrooloose/syntastic'

" TOML
Plugin 'cespare/vim-toml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntastic Settings
"--------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_rust_rustc_quiet_messages = { "level": "warnings" }

" Airline Settings
"--------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='term'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.maxlinenr = ''

" Markdown Settings
"--------------------
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" PyMode Settings
"--------------------
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_checkers = ['pyflakes', 'pylint', 'mccabe']

" Racer Settings
"--------------------
set hidden
let g:racer_cmd = "/usr/bin/racer"
"let g:racer_experimental_completer = 1

" Custom Settings
"--------------------

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.

runtime! archlinux.vim

" Onto the rest of the stuffs

set number 	    " Enable numbered lines
set mouse=a         " Enable the use of the mouse.
set sw=4            " Shift-width 4
set ts=4            " Tab width 4

set laststatus=2    " Always display powerline in all windows
set noshowmode      " Hide the default mode text
set ignorecase      " Case-insensitive search

set wrap            " These options soft wrap words when typing long lines at
set linebreak       " the end of the screen. 
set nolist

colorscheme peachpuff
 
filetype plugin indent on
syntax on

