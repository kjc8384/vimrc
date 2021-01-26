"Joongchul Kim : 20190816

" Vundle

set nocompatible
set hidden
filetype off

call plug#begin('~/.vim/plugged')

Plug 'geoffharcourt/vim-matchit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" need : CocInstall coc-json cos-tsserver coc-vetur coc-lists
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'liuchengxu/eleline.vim'
" need fonts : https://github.com/ryanoasis/nerd-fonts
"Plug 'steffanc/cscopemaps.vim'
"Plug 'vim-coffee-script'
"Plug 'derekwyatt/vim-scala'
"Plug 'Yggdroot/indentLine'
"Plug 'indenthtml.vim'
Plug 'othree/html5.vim'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
"Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

let g:airline#extensions#whitespace#enabled = 0

" load default
"source $VIMRUNTIME/vimrc_example.vim

set tags=tags;/,./tags
set nocompatible
set autoindent
set smartindent
set nobackup
set cursorline

" 20120702 cscope
"set cscopeprg=mlcscope


set noet
"set et
set ts=4
set sts=4
set sw=4
set backspace=2

set fileencodings=ucs-bom,utf-8,cp949
set encoding=utf-8

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" filetype settings {{{
" makefile
au BufNewFile,BufReadPost Makefile* set noet
au BufNewFile,BufReadPost makefile* set noet
au BufNewFile,BufReadPost *.mk set noet

" actionscript
au BufNewFile,BufReadPost *.as set filetype=actionscript
au BufNewFile,BufReadPost *.mxml set filetype=mxml

" diff
au BufNewFile,BufReadPost diff.log set filetype=diff

" tex
au BufNewFile,BufReadPost *.tex set et fileencoding=utf-8

" ejs
au BufNewFile,BufReadPost *.ejs set filetype=html

" coffeescript
au BufNewFile,BufReadPost *.coffee set et filetype=coffeescript

" python
au BufNewFile,BufReadPost *.py set et filetype=python

" typescript
au BufNewFile,BufReadPost *.ts set filetype=typescript

" json
au BufNewFile,BufReadPost *.json set filetype=json

" javascript
au BufNewFile,BufReadPost *.js set filetype=javascript suffixesadd+=.js

" yaml
au BufNewFile,BufReadPost *.yaml set et 

" markdown
au BufNewFile,BufReadPost *.md set et 
" }}}

syntax on
filetype plugin indent on

" basic size setting
au GUIEnter * winsize 80 40

"allow magic patterns in searches
set magic

"show ruler (line & column numbers)
set ruler
set number

set hls
"set incsearch

set title

"set foldmethod=marker

"use mouse wheel for scroll
if &term == "screen" && !has('nvim')
    set ttymouse=xterm2
endif

if has("mouse")
    set mouse=a
endif

"Color settings
color torte
"set background=dark
"highlight Normal guibg=none
"highlight NonText guibg=none

"persistant undo (7.3 or above)
set undofile
if has("unix")
    set undodir=$HOME/.vim/undo
elseif has("win32")
    set undodir=~/.vim/undo
else
	set undodir=$HOME/.vim/undo
endif


""" key mappings
nnoremap <F5> :checkt<CR>
nnoremap <F6> :make<CR>
nnoremap <F9> :!./%<CR>
nnoremap <F11> :set encoding=cp949<CR> :e<CR>
nnoremap <F12> :set encoding=utf-8<CR> :e<CR>

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

"backspace in Visual mode deletes selection
vnoremap <BS> d

" followings are specific for gvim
if has("gui_running")
"    source $VIMRUNTIME/mswin.vim
"    behave mswin
	
    "font
    set guifont=Monaco:h15
    "set guifont=Bitstream_Vera_Sans_Mono:h12:cANSI

    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>       "+gP
    map <S-Insert>      "+gP

    cmap <C-V>      <C-R>+
    cmap <S-Insert>     <C-R>+

    " Use CTRL-Q to do what CTRL-V used to do
    noremap <C-Q>       <C-V>
endif

nnoremap <C-H> :bp<CR>
nnoremap <C-L> :bn<CR>
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>

" for maven...
"set makeprg=mvn3\ compile\ -f\ /kbs/kdns3/nrcs_web/pom.xml
"set errorformat=\[ERROR]\ %f:[%l\\,%v]\ %m

" syntastic
" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:syntastic_java_checkers = ['checkstyle']  " use checkstyle, even if I have javac installed
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']

let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = "--csv --file config.json"

let g:tagbar_usearrows = 1

"use tidy
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'

" vcscommand
nnoremap <F7> :Gdiffsplit<CR>
nnoremap <F8> :Gblame<CR>

"vim-airline
let g:airline_theme='molokai'
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" OS clipboard integration
" be sure to check +clipboard 
" mac
"set clipboard=unnamed
" linux
set clipboard=unnamedplus

"Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>

"Coc
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" grep by motion
vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList --normal grep '.word
endfunction

" grep current word in current buffer
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" json formatting
nmap <Leader>jq :%!jq<CR>

" URL encode/decode selection
vnoremap <leader>en :!python -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'<cr>
vnoremap <leader>de :!python -c 'import sys,urllib;print urllib.unquote(sys.stdin.read().strip())'<cr>

let g:rainbow_active = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#303030 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#191919 ctermbg=4

set noshowmode
