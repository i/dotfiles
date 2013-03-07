""call pathogen#infect()

""
"" Basic Setup
""

nnoremap <leader>\ :nohl<CR>
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set mouse=a
inoremap jj <Esc>
""
"" Statusline/Powerline
""

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
let g:Powerline_symbols = 'compatible'

""
"" Colorscheme
""

syntax enable
colorscheme desert

""
"" Whitespace
""
filetype indent on

set nowrap                        " don't wrap lines
set tabstop=4                     " a tab is four spaces
set shiftwidth=4                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

""
"" Exceptions to whitespace defaults
""

autocmd FileType make setlocal noexpandtab

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

au Filetype make setlocal noexpandtab

"comment lines
fu! CommentLineANSI()
    if empty(matchstr(getline('.'),'^\s*/\*.*\*/\s*'))
        :s/^\(.*\)$/\/*\1*\//
        else
            :s/^\/\*\(.*\)\*\//\1/
        endif
            :silen! /dskfldsjkldd
endfunction
fu! CommentBlock()
    :'< s/^/\/*/
    :'> s/$/*\//
endfu
nmap <C-_> :call CommentLineANSI()<CR>
imap <C-_> <C-0> :call CommentLineANSI()<CR>
vmap <C-_> :call CommentLineANSI()<CR>gv

