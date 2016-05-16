filetype plugin indent on
set nocp

set guifont=Monospace\ 13
set guioptions=aegimt

set fileencodings=utf-8,gb2312,gbk,gb18030
"set termencoding=utf-8
"set encoding=prc

set nu
set nowrap

set autoread
set autowrite
set noeb
set autochdir

set foldmethod=syntax
set foldcolumn=3
set foldenable

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set expandtab 
set smartindent
set wildmenu

set nobackup
set noswapfile

set ruler
syntax enable
syntax on
set cursorline
colorscheme desert

set magic
set hlsearch
"set incsearch
set showmatch
set matchtime=5

set tags+=~/.vim/tags/cpp
set tags+=./my_cpp_tags
set tags+=./my_c_tags
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/qt4


set completeopt=menuone,menu,longest
let OmniCpp_NamespaceSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_GlobalScopeSearch = 1  
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"au CursorMoved, InsertLeave * if pumvisible() == 0|silent! pclose | endif
"set completeopt+=preview

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

let NERDTreeMouseMode=2
let NERDTreeChristmasTree=1

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			elseif winnr("$") == 2
				if bufwinnr("__Tag_List__") != -1
					q
				endif
			endif
		endif
    endif
endfunction


cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"imap <C-p> <Up>
"imap <C-n> <Down>
"imap <C-f> <Right>
"imap <C-b> <Left>
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -f my_cpp_tags .<CR>
map <C-F11> :!ctags -R --c-kinds=+p --fields=+S -f my_c_tags .<CR>
map <F12> :set tags+=my_cpp_tags<CR>
map <F11> :set tags+=my_c_tags<CR>
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
map <F4> :TlistToggle<CR>
imap <F4> <ESC>:TlistToggle<CR>
map <F5> :!make -j4 && ./build/pbat &<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.cl set syntax=cl

let g:DoxygenToolkit_authorName="Yizi Wu, wuyz_king@sina.com.cn"
"let s:licenseTag="Copyright(C)\"
"let s:licenseTag=s:licenseTag . "Yizi Wu @ HPCSIP\"
"let s:licenseTag=s:licenseTag . "All right reserved\"
"let g:DoxygenToolkit_licenseTag=s:licenseTag
let g:DoxygenTookit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

let g:pydiction_location='~/.vim/plugin/complete-dict'  
