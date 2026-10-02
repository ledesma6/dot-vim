filetype plugin indent on   " Filetype detection, plugins, and autoindent 
syntax on                   " Enable syntax highlighting
set number                  " Show line numbers
set clipboard=unnamedplus   " Use system clipboard
set hlsearch                " Highlight search results
set incsearch               " Search as you type
set ignorecase              " Ignore case when searching...
set smartcase               " ...unless capital letters are used

" load NERDTree when vim is launched
autocmd VimEnter * NERDTree " load NERDTree when vim is launched

" toggle NERDTree using Ctrl + n
nnoremap <C-n> :NERDTreeToggle<CR> 

" apply a pre-configured template to the buffer when a adding a .vim file to
" ftplugin/
augroup FtpluginTemplate
  autocmd!
  autocmd BufNewFile ~/.vim/ftplugin/*.vim 0r ~/.vim/templates/ftplugin.vim
augroup END

"run a buffer command; optionally toggle quckfix on/off. 
function! RunTask(var_name, ...)
	let l:use_qf = get(a:, 1, 0)
	let l:cmd = get(b:, a:var_name, '')
	
	if empty(l:cmd)
		echo "No " . a:var_name . " set for " . &filetype
		return
	endif
	
	if l:use_qf
		let &l:makeprg = expandcmd(l:cmd)
		silent make
		redraw!
		cwindow
	else
		execute '!' . expandcmd(l:cmd)
		edit!
	endif
endfunction


" --- Global Key Mappings ---
" <Leader>b  -> Build / Compile / Syntax Check
" <Leader>l  -> Lint / Static Analysis
" <Leader>t  -> Test
" <Leader>f  -> Format

nnoremap <Leader>b :call RunTask('makeprg', 1)<CR>
nnoremap <Leader>l :call RunTask('lintprg', 1)<CR>
nnoremap <Leader>t :call RunTask('testprg', 1)<CR>
nnoremap <Leader>f :call RunTask('formatprg', 0)<CR>

autocmd  BufWinLeave * if &buftype==# 'quickfix' | echo "don't give up, skeleton" | endif

