filetype plugin indent on   " Filetype detection, plugins, and autoindent 
syntax on                   " Enable syntax highlighting
set number                  " Show line numbers
set clipboard=unnamedplus   " Use system clipboard
set hlsearch                " Highlight search results
set incsearch               " Search as you type
set ignorecase              " Ignore case when searching...
set smartcase               " ...unless capital letters are used

autocmd VimEnter * NERDTree " load NERDTree when vim is launched
nnoremap <C-n> :NERDTreeToggle<CR> " toggle NERDTree using Ctrl + n

