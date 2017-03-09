" Use Vim settings, rather than Vi settings (much better!)
" This must be first, because it changes other options as a side effect.
" vim:set ts=2 sts=2 sw=2 expandtab:
set nocompatible
set guitablabel=%t

" leader
let mapleader=","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" do not keep a backup file
set nobackup

" do not keep a swap file
set noswapfile

" keep 50 lines of command line history
set history=50

" display incomplete commands
set showcmd

" column
set textwidth=110
set cc=+1

" do incremental searching
set incsearch

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it
if has('mouse')
  set mouse=a
endif

" Added as per vim-markdown readme, to avoid folding
let g:vim_markdown_folding_disabled=1

" Numbers, up to 3 digits
set number numberwidth=3

" Vimscript file settings
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" sexy shit for pathogen
execute pathogen#infect()

" enable plugins
filetype plugin indent on

" Switch syntax highlighting on
syntax on

" Show invisibles
set listchars=trail:•,precedes:«,extends:»,eol:¬,tab:▸▸
set list

" Use 2 spaces as tab size
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" NERDCommenter space delimiters
let g:NERDSpaceDelims = 1

" Tab shortcut for non gui mode
nnoremap <C-J> :tabprevious<CR>
nnoremap <C-K> :tabnext<CR>

" Ctrlp.vim excluded paths
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](bin|tmp|images)$',
  \ }
let g:ctrlp_map = '<leader>p'
let g:ctrlp_root_markers = ['ROOT']

" Vexplore config
" nnoremap <leader>q :Vexplore<CR>
" NERDTree togggle
nnoremap <leader>q :NERDTreeToggle<CR>

" Window sizing
set winwidth=115
set laststatus=2
set showtabline=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
let g:airline_theme = "molokai"

" lemme copy to clipboard
vnoremap <C-c> "*y

" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=6
set winminheight=6
set winheight=999

let g:netrw_liststyle=3
let g:netrw_winsize=25
let g:netrw_browse_split=2

" More natural splits
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>y :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
nnoremap <leader>c :w\|:!script/features<cr>
nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Are we in a test file?
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|test_.*\.py\|_test.py\)$') != -1

    " Run the tests for the previously-marked file (or the current file if
    " it's a test).
    if in_test_file
        call SetTestFile(command_suffix)
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile(command_suffix)
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
    let sep = '----------------------------------------'
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename . ";echo " . sep
        else
            exec ":!rspec --color " . a:filename . ";echo " . sep
        end
    end
endfunction

""""""""""""""""""""""""""""""""""""""""""""
" rubocop
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>r :call RunRubocop()<cr>

function! RunRubocop(...)
  " Write the file and run tests for the given filename
  if expand("%") != ""
    :w
  end

  exec ":!rubocop " . expand("%")
endfunction

""""""""""""""""""""""""""""""""""""""""""""
" gutentags stuff
""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['ROOT']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:set background=dark
:color vibrantink
