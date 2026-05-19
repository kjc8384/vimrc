"Joongchul Kim : 20190816

" Vundle

set nocompatible
set hidden
filetype off

" load default
"source $VIMRUNTIME/vimrc_example.vim

set tags=tags;/,./tags
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
au BufNewFile,BufReadPost *.js set filetype=javascript suffixesadd+=.js,.vue,.scss
au BufNewFile,BufReadPost *.vue set suffixesadd+=.js,.vue,.scss

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
nnoremap <C-K> :lnext<CR>
nnoremap <C-J> :lprev<CR>

" for maven...
"set makeprg=mvn3\ compile\ -f\ /kbs/kdns3/nrcs_web/pom.xml
"set errorformat=\[ERROR]\ %f:[%l\\,%v]\ %m

" syntastic
" When writing a file, if there are errors, have Syntastic plugin mark them
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1

" let g:syntastic_java_checkers = ['checkstyle']  " use checkstyle, even if I have javac installed
" let g:syntastic_enable_perl_checker = 1
" let g:syntastic_perl_checkers = ['perl']

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_typescript_checkers = ['eslint']

" let g:syntastic_coffee_checkers = ['coffeelint']
" let g:syntastic_coffee_coffeelint_args = "--csv --file config.json"

" let g:tagbar_usearrows = 1

" "use tidy
" let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'

" vcscommand
nnoremap <F7> :Gdiffsplit<CR>
nnoremap <F8> :Git blame<CR>

set laststatus=2

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

" json formatting
nmap <Leader>jq :%!jq<CR>

" URL encode/decode selection
vnoremap <leader>en :!python -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'<cr>
vnoremap <leader>de :!python -c 'import sys,urllib;print urllib.unquote(sys.stdin.read().strip())'<cr>

let g:NERDSpaceDelims = 1

let g:rainbow_active = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#303030 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#191919 ctermbg=4

set noshowmode

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <leader><leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

let g:rainbow_conf = {
			\ 'guifgs': ['Gold1', 'violet', 'Lime', 'Magenta2'],
			\}

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
