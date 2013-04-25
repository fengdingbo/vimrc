" =======================================
" Author: qiufeng<fengdingbo@gmail.com>
" Description: qiufeng's personal vim config file.
" Blog: http://www.fengdingbo.com/
" Since: 2010-04-01
" =======================================
syntax on
set number
set autoindent
set ruler
set tabstop=4
set incsearch
set showmatch
" 高亮显示当前行
set cursorline
" 在搜索的时候忽略大小写
set ignorecase
" 高亮被搜索的句子（phrases）
set hlsearch
" set mouse=a
" set shiftwidth
" set background=dark

" Reopening a file
" VIM jump to the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif
" PHP函数提示 
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
    set complete-=k complete+=k
endfunction
" 按F2可直接拿当前文件到PHP进行解析并运行
map <special> <F2> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/php" %<cr>
map <F3> :wq<cr>
" nmap <C-t> a<C-R>=strftime("%c")<CR> <Esc>
nmap <C-t> :call AddTitle()
function AddTitle()
	call append(1,"/**")
	call append(2," * ")
	call append(3," * @date ".strftime("%c"))
	call append(4," * @autthor qiufeng")
	call append(5," * @link http://www.fengdingbo.com")
	call append(6," */")
	:3
endfunction
