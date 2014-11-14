" Use Vim settings, rather than Vi settings (much better!). --------------- {{{
" This must be first, because it changes other options as a side effect.
set nocompatible
" }}}
" allow backspacing over everything in insert mode ------------------------ {{{
set backspace=indent,eol,start
" }}}
" do not keep a backup file ----------------------------------------------- {{{
set nobackup
" }}}
" do not keep a swap file ------------------------------------------------- {{{
set noswapfile
" }}}
" keep 50 lines of command line history ----------------------------------- {{{
set history=50
" }}}
" display incomplete commands --------------------------------------------- {{{
set showcmd
" }}}
" do incremental searching ------------------------------------------------ {{{
set incsearch
" }}}
" Don't use Ex mode, use Q for formatting --------------------------------- {{{
map Q gq
" }}}
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, - {{{
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" }}}
" In many terminal emulators the mouse works just fine, thus enable it. --- {{{
if has('mouse')
  set mouse=a
endif
" }}}
" Convenient command to see the difference between the current ------------ {{{
" buffer and the file it was loaded from, thus the changes you made.
" Only define it when not defined already.

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" }}}
" Added as per vim-markdown readme, to avoid folding ---------------------- {{{
let g:vim_markdown_folding_disabled=1
" }}}
" Color scheme ------------------------------------------------------------ {{{
colorscheme autobot
" }}}
" Font and size ----------------------------------------------------------- {{{
"set guifont=Inconsolata\ for\ Powerline:h16
set guifont=Liberation\ Mono\ for\ Powerline:h14
" }}}
" Numbers, up to 5 digits ------------------------------------------------- {{{
set number numberwidth=5
" }}}
" Editing this file ------------------------------------------------------- {{{
nnoremap <leader>q :source $MYVIMRC<cr>
" }}}
" Statusline vim-airline -------------------------------------------------- {{{
set laststatus=2
set statusline=%-60.60F 		" reserve 60 chars for full filename
set statusline+=%-15.15y		" reserve 15 chars for filetype
set statusline+=%l			" current line number
set statusline+=/			" sepparator
set statusline+=%-4L			" total lines
set statusline+=@ 			" at
set statusline+=%4c			" column number
set statusline+=%=			" go to the right
set statusline+=%3m 			" reserve 3 spaces for modified flag
let g:airline_powerline_fonts = 1
" }}}
" Vimscript file settings ------------------------------------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Set textwidth to 0 ------------------------------------------------------ {{{
set textwidth=0
" }}}
" sexy shit for pathogen -------------------------------------------------- {{{
execute pathogen#infect()
" }}}
" enable plugins ---------------------------------------------------------- {{{
filetype plugin indent on
" }}}
" Switch syntax highlighting on ------------------------------------------- {{{
syntax on
" }}}
" Show invisibles --------------------------------------------------------- {{{
set listchars=trail:•,precedes:«,extends:»,eol:¬,tab:▸▸
set list
" }}}
" Use 2 spaces as tab size ------------------------------------------------ {{{
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
" }}}
" Tab shortcut for non gui mode ------------------------------------------- {{{
nnoremap <C-J> :tabprevious<CR>
nnoremap <C-K> :tabnext<CR>
" }}}
