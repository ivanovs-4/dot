" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" au BufEnter *.hs compiler ghc
autocmd FileType haskell set includeexpr=substitute(substitute(v:fname,'\\.','/','g'),'$','.hs','')
