" vim config

" set line number
set number
" syntax highlighting
syntax on
" set tab spaces
set tabstop=2
" mouse support
set mouse=a
" incremental search
set incsearch
" use system clipboard
set clipboard=unnamedplus
" current line highlighting
set cursorline
" filetype indentation
filetype indent on

" set backup and swap file directory
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" encoding
set encoding=utf-8
" dont reset cursor to start of line when moving around.
set nostartofline
" show the current mode
set showmode
" show the filename in the window titlebar
set title
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" better command-line completion
set wildmenu
