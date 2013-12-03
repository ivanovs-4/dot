" vundle
" !git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off " обязательно!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on " обязательно!

" Bundle 'kana/vim-textobj-entire'

Bundle 'ervandew/screen'
" nnoremap <Leader>s :ScreenSend<cr>
nnoremap <F7> :ScreenSend<cr>
nnoremap <Leader><F7> :ScreenShell<cr>
" nnoremap <Leader>sq :ScreenQuit<cr>

" Bundle 'edsono/vim-matchit'
filetype plugin on
runtime macros/matchit.vim

Bundle 'vim-scripts/indentpython.vim'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'

Bundle 'pythonhelper'

" Bundle 'vim-scripts/Git-Branch-Info'
" Bundle 'gerw/vim-HiLinkTrace'
" Bundle 'vim-scripts/L9'
" Bundle 'vim-scripts/FuzzyFinder'
" Bundle 'kevinw/pyflakes-vim'

" Bundle 'klen/python-mode.git'
" let pymode_lint_checker='pyflakes'
" let pymode_lint=0
" let pymode_folding=0

" Custom textobjects
Bundle 'kana/vim-textobj-user.git'
Bundle 'kana/vim-textobj-entire.git'
Bundle 'kana/vim-textobj-indent.git'
Bundle 'kana/vim-textobj-syntax.git'
" Bundle 'kana/vim-textobj-line.git'
Bundle 'bps/vim-textobj-python.git'
" Bundle 'kana/vim-textobj-lastpat.git'
" Bundle 'kana/vim-textobj-comment.git'
" Bundle 'kana/vim-textobj-brace.git'
" Bundle 'kana/vim-textobj-between.git'
" Bundle 'saihoooooooo/vim-textobj-space.git'

