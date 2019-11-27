set number
set guioptions-=T
set guioptions+=a
set nofoldenable
set title
set hlsearch
set wrapscan
set incsearch
set ignorecase
set smartcase
set clipboard+=autoselect
set clipboard^=unnamedplus
set showmatch
set matchtime=1
set mouse=a
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set backspace=indent,eol,start
set display=lastline

"キーバインド設定
nnoremap Q <Nop>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$

"各言語エスケープコマンド
autocmd BufNewFile,Bufread *.html nnoremap <C-j> <End>a--><Esc><Home>i<\!--<Esc>
autocmd BufNewFile,Bufread *.html nnoremap <C-h> <End>xxx<Esc><Home>xxxx<Esc>
autocmd BufNewFile,Bufread *.css nnoremap <C-j> <End>a*/<Esc><Home>i/*<Esc>
autocmd BufNewFile,Bufread *.css nnoremap <C-h> <End>xx<Esc><Home>xx<Esc>
autocmd BufNewFile,Bufread *.php nnoremap <C-j> <Home>i//<Esc>
autocmd BufNewFile,Bufread *.php nnoremap <C-h> <Home>xx<Esc>
autocmd BufNewFile,Bufread *.js nnoremap <C-j> <Home>i//<Esc>
autocmd BufNewFile,Bufread *.js nnoremap <C-h> <Home>xx<Esc>
autocmd BufNewFile,Bufread *.xml nnoremap <C-j> <End>a--><Esc><Home>i<\!--<Esc>
autocmd BufNewFile,Bufread *.xml nnoremap <C-h> <End>xxx<Esc><Home>xxxx<Esc>


" vim-polyglot
set runtimepath+=~/src/vim-polyglot
syntax enable
filetype plugin indent on
" 行番号色
highlight LineNr ctermfg=015
highlight CursorLineNr ctermfg=000 ctermbg=220
set cursorline
highlight clear CursorLine

" Filetype AS
autocmd BufRead,BufNewFile *.as setfiletype as
autocmd BufNewFile,Bufread *.as nnoremap <C-j> <Home>i;<Esc>
autocmd BufNewFile,Bufread *.as nnoremap <C-h> <Home>x<Esc>

" 辞書
autocmd FileType php :set dictionary=~/.vim/dict/PHP.dict
autocmd FileType as :set dictionary=~/.vim/dict/AS.dict

" dein Script--------------------------------------

if &compatible
	set nocompatible	" Be iMproved
endif

" Required :
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" プラグインがインストールされるディレクトリ
"let s:dein_dir = expand('~/.cache/dein')

" dein.vim本体
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが無ければgithubから落としてくる
"if &runtimepath !~# '/dein.vim'
"	if !isdirectory(s:dein_repo_dir)
"		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"	endif
"	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
"endif

" 設定開始
if dein#load_state($HOME . '/.cache/dein')
	call dein#begin($HOME . '/.cache/dein')

	" プラグインリストを収めたTOMLファイル
	let s:toml_dir	= $HOME . '/.vim/rc/'
	let s:toml	= s:toml_dir . '/dein.toml'
	let s:lazy_toml	= s:toml_dir . '/dein_lazy.toml'

	" TOMLを読み込みキャッシュしておく
	call dein#load_toml(s:toml,	{'lazy': 0})
	call dein#load_toml(s:lazy_toml,{'lazy': 1})

	" 設定終了
	call dein#end()
	call dein#save_state()

endif

" Required :
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" End dein Scripts-----------------------------------
"
" Start sneocomplete.vim設定-------------------------------
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use underbar completion
let g:neocomplete#enable_underbar_completion = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"autocmd FileType php setlocal omnifunc=phpcomplete#Complete
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"autocmd FileType c setlocal omnifunc=ccomplete#Complete
let g:neocomplete#sources#omni#input_patterns.as = '[^.[:digit:] *\t]\%(\.\|->\)'
"autocmd FileType as setlocal omnifunc=ascomplete#Complete
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" End sneocomplete.vim設定-------------------------------
