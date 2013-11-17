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
set scrolloff=3
set sidescrolloff=5
set display+=lastline

set hlsearch
" set infercase
set incsearch
set ignorecase
set smartcase
set laststatus=2
" set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]
set cursorline
set nowrap
set linebreak

set autowriteall
set autoread
set wildmenu
set wildmode=full:list
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.log

" " Show full tags when doing search completion
" set showfulltag
"
" " Speed up macros
" set lazyredraw

" Turn off swap files
set nobackup
set updatecount=0

set path=**

" turn off octal numbers for <C-a>, <C-x>
set nrformats-=octal
set shiftround
" set ttimeout
" set ttimeoutlen=50

" set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set shell=/bin/bash

set fileformats+=mac

set tabpagemax=9

set history=1024
" viminfo options.txt 7577
set viminfo='40,f1,<44,:48,@55,/59,%77

" ex_mode/history-scrollers.vim
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

inoremap <C-U> <C-G>u<C-U>

" Y baheave as C and D
nnoremap Y y$

" moving through windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-w>l
map <C-H> <C-W>h

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
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" all keys but leader \ (ё)
set langmap=ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁ[ЯЧСМИТЬБЮ?;QWERTYUIOP{}ASDFGHJKL:\"\|~ZXCVBNM<>?,йцукенгшщзхъфывапролджэ]ячсмитьбю/;qwertyuiop[]asdfghjkl\;'`zxcvbnm\\\,./

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
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" to python class begin
nnoremap [c ?^class <cr>


" vundle
" !git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off " обязательно!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on " обязательно!

" Bundle 'python-imports.vim'
Bundle 'vim-scripts/indentpython.vim'
" Bundle 'vim-ipython'
" Bundle 'klen/python-mode.git'

Bundle 'ervandew/screen'
nnoremap <Leader>s :ScreenSend<cr>
vnoremap <Leader>s :ScreenSend<cr>
nnoremap <Leader>ss :ScreenShell<cr>
nnoremap <Leader>sq :ScreenQuit<cr>

Bundle 'edsono/vim-matchit'

Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-speeddating'
Bundle 'pythonhelper'


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

