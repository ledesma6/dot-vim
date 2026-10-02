" ~/.vim/ftplugin/FILETYPE.vim
" buffer configuration for FILETYPE

" enable omni completion for this filetype
setlocal omnifunc=...

" --- File-Local Autocmds (Optional) ---
" augroup <Language>AutoX
"   autocmd! * <buffer>
"   autocmd BufWritePost <buffer> ...
" augroup END

" --- Build, Lint & Test Setup ---

" use a built-in setting for makeprg and errorformat
" compiler ...

" Set errorformat if not using a built-in compiler setting
" setlocal errorformat=...

" b:makeprg -> (Optional) custom command for builds, will replace what is set by compiler
" b:lintprg  -> command for linter / static analysis
" b:testprg  -> command to run unit tests
" b:formatprg  -> command for autoformatter

" let b:makeprg = '...'
let b:lintprg = '...'
let b:testprg = '...'
let b:formatprg = '...'

" --- Buffer Cleanup on Filetype Switch ---
let b:undo_ftplugin = get(b:, 'undo_ftplugin', '')
  \ . '| setlocal omnifunc<'
  \ . '| setlocal errorformat<'
  \ . '| unlet! b:makeprg b:lintprg b:testprg b:formatprg'

