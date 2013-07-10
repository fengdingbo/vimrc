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
map <F4> :TlistToggle <cr>
map <F3> :wq<cr>
" nmap <C-t> a<C-R>=strftime("%c")<CR> <Esc>

set tags=/home/qiufeng/tmp/php/php-src/tags
set autochdir

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
