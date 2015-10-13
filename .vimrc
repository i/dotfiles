"" Basic setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set cursorcolumn      " Show vertical line
set cursorline
set shell=zsh\ -l
hi CursorLine       guifg=NONE        guibg=#121212     gui=NONE

set encoding=utf-8    " Set default encoding to UTF-8
set mouse=a
set pastetoggle=<F10>
syntax enable         " Turn on syntax highlighting allowing local overrides


nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap \\ :nohl<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>f yiw:Ag <C-r>"<CR>
nnoremap <leader>nn :set nonumber<CR>
nnoremap <leader>sn :set number<CR>
noremap L $
noremap H 0
vnoremap <leader>f :fold<CR>
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Ruby stuff
nnoremap <leader>t :! ruby -Itest %<CR>
nnoremap <leader>r :! ruby %<CR>

" Go stuff
nnoremap <leader>gr :! go run %<CR>
nnoremap <leader>gt :! go test<CR>
nnoremap <leader>gi :GoImports<CR>

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim


" Format html
nnoremap <leader>ht :set filetype=html<cr>ggVGJ:%s/>\s*</>\r</g<CR>gg=G

" Wrap line in quotes
nnoremap <leader>ww :call Wrap()<CR>j
nnoremap <leader>w, :call WrapWithComma()<CR>j
nnoremap <leader>,  :call AddComma()<CR>j

function! AddComma()
  normal A,
endfunction

function! Wrap()
  normal I"
  normal A"
endfunction

function! WrapWithComma()
  normal I"
  normal A",
endfunction


nnoremap <C-i> :vs<CR>
nnoremap ; :
inoremap <C-v> <F10><C-r>+<F10>
inoremap JJ <Esc>
inoremap jj <Esc>
inoremap jJ <Esc>
inoremap Jj <Esc>

"Shift lines up or down
noremap <C-j> ddp
noremap <C-k> kddpk
noremap <C-h> hxph
noremap <C-l> xp

noremap <C-b> :buffers<CR>
vnoremap <C-c> "+y
"noremap   <buffer> K      :s,^\(\s*\)[^# \t]\@=,\1#,e<CR>:nohls<CR>zvj
map <C-n> :NERDTreeToggle<CR>

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""Bundles
Plugin 'godlygeek/tabular'
Plugin 'gf3/peg.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-endwise'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rking/ag.vim'
Plugin 'solarnz/thrift.vim'
Plugin 'elzr/vim-json'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab.git'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-rails'
Plugin 'digitaltoad/vim-jade'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/loremipsum'
Plugin 'mattn/emmet-vim'
Plugin 'itspriddle/vim-stripper'
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on


" Associate language syntax with file extensions
au BufNewFile,BufRead *.go         setlocal ft=go
au BufNewFile,BufRead *.mustache   setlocal ft=mustache
au BufNewFile,BufRead *.tpl        setlocal ft=mustache
au BufNewFile,BufRead *.hbs        setlocal ft=mustache
au BufNewFile,BufRead *.handlebars setlocal ft=mustache
au BufNewFile,BufRead *.js.es6     setlocal ft=javascript
au BufNewFile,BufRead *.pp         setlocal ft=ruby
au BufNewFile,BufRead .arcconfig   setlocal ft=json
au BufNewFile,BufRead *json        setlocal ft=json

""
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'


set clipboard=unnamed " Use system clipboard
set nocompatible      " Disable vi-compatibility
set laststatus=2      " Always show the statusline
set encoding=utf-8    " Necessary to show unicode glyphs
set t_Co=256

" Use 256 colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"" Colorscheme
syntax enable
"colorscheme aiseered
"colorscheme Tomorrow-Night-Eighties
colorscheme ian
hi Normal ctermbg=none
" colorscheme bclear

"" Whitespace
filetype indent on

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is four spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
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

"Fix clipboard for tmux

if $TMUX
  set clipboard+=unnamed
endif

set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

au Filetype make setlocal noexpandtab
highlight Pmenu ctermfg=green ctermbg=black

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> \h :Entities 0<CR>
noremap <silent> \H :Entities 1<CR>
