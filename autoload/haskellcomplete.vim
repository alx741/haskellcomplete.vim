" Vim completion script
" Language:        Haskell
" Original Author: Daniel Campoverde <alx@sillybytes.net>
" URL:             https://github.com/alx741/haskellcomplete.vim
" Last Change:     2018 Aug 26

let b:completingLangExtension = 0

function! haskellcomplete#Complete(findstart, base)
    if a:findstart
        let l:line = getline('.')
        let l:start = col('.') - 1

        if l:line =~ '^\s*{-#\s*LANGUAGE.*'
            while l:start >= 0 && l:line[l:start - 1] !~ '[, ]'
                let l:start -= 1
            endwhile
            let b:completingLangExtension = 1
            return l:start
        endif

        return start
    endif

    if b:completingLangExtension
        if a:base ==? ""
            " Return all posible Lang extensions
            echomsg "ALL extensions"
            return s:langExtensions
        else
            echomsg "dont know yet"
        endif
    endif
endfunction

let s:langExtensions =
    \ [ "DeriveGeneric"
    \ , "DeriveFunctor"
    \ ]
