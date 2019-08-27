"Joongchul Kim : 20190816

" Vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'syntastic'
Plugin 'ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'steffanc/cscopemaps.vim'
Plugin 'vim-coffee-script'
Plugin 'derekwyatt/vim-scala'
Plugin 'vcscommand.vim'
"Plugin 'Yggdroot/indentLine'
Plugin 'indenthtml.vim'
"Plugin 'vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'

call vundle#end()

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

" json
au BufNewFile,BufReadPost *.json set filetype=javascript

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

" yaml
au BufNewFile,BufReadPost *.yaml set et 
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

set foldmethod=marker

"use mouse wheel for scroll
if &term == "screen"
    set ttymouse=xterm2
endif

if has("mouse")
    set mouse=a
endif

"Color settings
color torte
"set background=dark

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

"map <C-o> :vs ./<cr>

nnoremap <F5> :checkt<CR>
nnoremap <F6> :make<CR>
nnoremap <F9> :!./%<CR>
nnoremap <F11> :set encoding=cp949<CR> :e<CR>
nnoremap <F12> :set encoding=utf-8<CR> :e<CR>

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>




" comment/uncomment mapping
map <Leader>3 :s/^/#/g<CR>
map <Leader>4 :s/^#//g<CR>
map <Leader>5 :s/^/\/\//g<CR>
map <Leader>6 :s/^\/\///g<CR>

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

" jckim for maven...
set makeprg=mvn3\ compile\ -f\ /kbs/kdns3/nrcs_web/pom.xml
set errorformat=\[ERROR]\ %f:[%l\\,%v]\ %m

" jckim syntastic
" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:syntastic_java_checkers = ['checkstyle']  " use checkstyle, even if I have javac installed
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']

"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = "--csv --file config.json"

let g:tagbar_usearrows = 1

"use tidy
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy'

" vcscommand
nnoremap <F7> :VCSVimDiff<CR>
nnoremap <F8> :VCSAnnotate!<CR>

"vim-airline
let g:airline_theme='molokai'
set laststatus=2
let g:airline#extensions#tabline#enabled=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"function s:find_jshintrc(dir)
"    let l:found = globpath(a:dir, '.jshintrc')
"    if filereadable(l:found)
"        return l:found
"    endif
"
"    let l:parent = fnamemodify(a:dir, ':h')
"    if l:parent != a:dir
"        return s:find_jshintrc(l:parent)
"    endif
"
"    return "~/.jshintrc"
"endfunction
"
"function UpdateJsHintConf()
"    let l:dir = expand('%:p:h')
"    let l:jshintrc = s:find_jshintrc(l:dir)
"    let g:syntastic_javascript_jshint_args = '--config ' . l:jshintrc
"    echo '--config' + l:jshintrc
"endfunction
"
"au BufEnter * call UpdateJsHintConf()

"for javascript : http://dance.computer.dance/posts/2015/04/using-ctags-on-modern-javascript.html

" OS clipboard integration
" be sure to check +clipboard 
set clipboard=unnamed
