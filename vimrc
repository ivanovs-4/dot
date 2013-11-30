set nocompatible

set encoding=utf-8

set autoindent
set smartindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set smarttab
set showcmd 
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ruler
set scrolloff=7
set sidescrolloff=9
set display+=lastline
set clipboard+=unnamed

set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
" set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]
set cursorline
set nowrap
set linebreak

set autowriteall
" set autowrite

set autoread
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.log

"" Show full tags when doing search completion
"set showfulltag
"
"" Speed up macros
"set lazyredraw

" Turn off swap files
set nobackup
set updatecount=0

set path=**
set suffixesadd+=.py

" turn off octal numbers for <C-a>, <C-x>
set nrformats-=octal
set shiftround
" set ttimeout
" set ttimeoutlen=50

" set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set shell=/bin/bash

set fileformats=unix

set tabpagemax=9

set history=10240

" viminfo options.txt 7577
set viminfo='4000,f100,<4400,:4800,@5500,/5900,%7700

" ex_mode/history-scrollers.vim
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

inoremap <C-U> <C-G>u<C-U>

" Y baheave as C and D
nnoremap Y y$

nnoremap <F5> :make<cr>
" moving through windows
" map <C-J> <C-W>j
" map <C-K> <C-W>k
" map <C-L> <C-w>l
" map <C-H> <C-W>h

set t_Co=256
syntax on
color iv-color

" " C-Up C-Down переместить строку
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" russian
set keymap=russian-jcukenmac
set iminsert=0 
set imsearch=0 
highlight lCursor guifg=NONE guibg=Cyan

" hide search matches
nnoremap <silent><C-l> :<C-u>nohlsearch<cr><C-l>

" sort
nnoremap <Leader>s :sort i<cr>
vnoremap <Leader>s :sort i<cr>

" fast :w
nnoremap <Leader>w :w<cr>

" sudo save
nnoremap <Leader><C-w>:w !sudo tee % > /dev/null<cr>

" compose jira text to commit comment
nnoremap <Leader>j gg0dwJJ<ESC>

" edit ~/.vim/colors/iv-color.vim
nnoremap <Leader>C :n ~/.vim/colors/iv-color.vim<cr>

" edit reload .vimrc
nnoremap <Leader>V :n $MYVIMRC<cr>

" reload .vimrc
nnoremap <Leader>v :update<cr>:so $MYVIMRC<cr>
" autocmd BufWritePost ~/.vimrc   so ~/.vimrc

" restart current service
nnoremap <Leader>r :!~/work/rasp/tools/fcgi.sh restart<cr>

" git diff
nnoremap <Leader>d :!clear; git diff -U2 HEAD<cr>

" rebuild tags
nnoremap <leader>T :!ctags -R .<cr>
"
" nmap xxxxx :%s/\<<c-r>=expand("<cword>")<cr>\>/


" Python

" strip trailing space in python files
autocmd BufWritePre *.py normal m`:%s/\v\s+$//e<cr>``

" function TrimTrailingSpaceAndAddLastLine()
"     let save_cursor = getpos(".")
"     :silent! %s#\v\s+$##e
"     :silent! %s#\($\n\s*\)\+\%$##
"     normal G
"     put _
"     call setpos('.', save_cursor)
" endfunction

" autocmd BufWritePre *.py call TrimTrailingSpaceAndAddLastLine()

" to python class begin
nnoremap [c ?^class <cr>


" vundle
" !git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off " обязательно!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on " обязательно!

" Bundle 'kana/vim-textobj-entire'

" Bundle 'ervandew/supertab'
Bundle 'ervandew/screen'
" nnoremap <Leader>s :ScreenSend<cr>
nnoremap <F7> :ScreenSend<cr>
" nnoremap <Leader>ss :ScreenShell<cr>
" nnoremap <Leader>sq :ScreenQuit<cr>

" Bundle 'edsono/vim-matchit'
filetype plugin on
runtime macros/matchit.vim

" Bundle 'vim-scripts/L9'
" Bundle 'vim-scripts/FuzzyFinder'

" Bundle 'kevinw/pyflakes-vim'
Bundle 'vim-scripts/indentpython.vim'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'pythonhelper'

" Bundle 'gerw/vim-HiLinkTrace'

" Bundle 'klen/python-mode.git'
" let pymode_lint_checker='pyflakes'
" let pymode_lint=0
" let pymode_folding=0

" TIPS

" mapping for tpope/vim-fugitive
nnoremap <Leader>g :Gstatus<cr>

" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>


" TIP 'nelstrom/vim-visual-star-search'
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V ' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **/*.py'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **/*.py'<CR>


" TIP 'nelstrom/vim-qargs'
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

