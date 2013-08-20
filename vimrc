" Use Vim settings, rather than Vi settings (much better!). ---------------- {{{
" This must be first, because it changes other options as a side effect.
set nocompatible
" }}}
" allow backspacing over everything in insert mode ------------------------- {{{
set backspace=indent,eol,start
" }}}
" do not keep a backup file ------------------------------------------------ {{{
set nobackup
" }}}
" do not keep a swap file -------------------------------------------------- {{{
set noswapfile
" }}}
" keep 50 lines of command line history ------------------------------------ {{{
set history=50
" }}}
" display incomplete commands ---------------------------------------------- {{{
set showcmd
" }}}
" do incremental searching ------------------------------------------------- {{{
set incsearch
" }}}
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current ---- {{{
" buffer and the file it was loaded from, thus the changes you made.
" Only define it when not defined already.

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" }}}

" Added as per vim-markdown readme, to avoid folding
let g:vim_markdown_folding_disabled=1

" Color scheme
colorscheme distinguished

" Font and size
set guifont=Monaco:h13

" Numbers, up to 5 digits
set number numberwidth=5

" Editing this file
nnoremap <leader>q :source $MYVIMRC<cr>

" Statusline -------------------- {{{
set laststatus=2
set statusline=%-35.35F 		" reserve 35 chars for full filename
set statusline+=%-15.15y		" reserve 15 chars for filetype
set statusline+=%l			" current line number
set statusline+=/			" sepparator
set statusline+=%L			" total lines
set statusline+=%=			" go to the right
set statusline+=%3m 			" reserve 3 spaces for modified flag
" }}}

" Vimscript file settings ------------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
