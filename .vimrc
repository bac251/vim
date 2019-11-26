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

nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$

autocmd BufNewFile,Bufread *.html nnoremap <C-i> <End>a--><Esc><Home>i<\!--<Esc>
autocmd BufNewFile,Bufread *.html nnoremap <C-s> <End>xxx<Esc><Home>xxxx<Esc>
autocmd BufNewFile,Bufread *.css nnoremap <C-i> <End>a*/<Esc><Home>i/*<Esc>
autocmd BufNewFile,Bufread *.css nnoremap <C-s> <End>xx<Esc><Home>xx<Esc>
autocmd BufNewFile,Bufread *.php nnoremap <C-i> <Home>i//<Esc>
autocmd BufNewFile,Bufread *.php nnoremap <C-s> <Home>xx<Esc>
autocmd BufNewFile,Bufread *.js nnoremap <C-i> <Home>i//<Esc>
autocmd BufNewFile,Bufread *.js nnoremap <C-s> <Home>xx<Esc>


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
autocmd BufNewFile,Bufread *.as nnoremap <C-i> <Home>i;<Esc>
autocmd BufNewFile,Bufread *.as nnoremap <C-s> <Home>x<Esc>

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
