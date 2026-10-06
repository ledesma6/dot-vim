" ~/.vim/ftplugin/cpp.vim
" buffer configuration for C++

"enable omni completion for C++
setlocal omnifunc=ccomplete#Complete

" --- File-Local Autocmds (Optional) ---
" augroup <Language>AutoX
"   autocmd! * <buffer>
"   autocmd BufWritePost <buffer> ...
" augroup END

" --- Build, Lint & Test Setup ---

" use a built-in setting for makeprg and errorformat
compiler gcc 

" Set errorformat if not using a built-in compiler setting
" setlocal errorformat=...

" b:makeprg -> custom command for builds, will replace what is set by compiler
" b:lintprg  -> command for linter / static analysis
" b:testprg  -> command to run unit tests
" b:formatprg  -> command for autoformatter

let b:makeprg = 'cmake --build build'
let b:lintprg = 'cppcheck --enable=warning,style --template=gcc %'
let b:testprg = 'ctest --test-dir build --output-on-failure'
let b:formatprg = 'clang-format --assume-filename=%'

" --- Buffer Cleanup on Filetype Switch ---
let b:undo_ftplugin = get(b:, 'undo_ftplugin', '')
  \ . '| setlocal errorformat<'
  \ . '| unlet! b:makeprg b:lintprg b:testprg b:formatprg'

