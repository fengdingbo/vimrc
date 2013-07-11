" =======================================
" Author: qiufeng<fengdingbo@gmail.com>
" Description: qiufeng's personal vim config file.
" Blog: http://www.fengdingbo.com/
" Since: 2010-04-01
" =======================================

" 语法高亮
syntax on

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 缩进
set autoindent

" 制表符
set ts=4
set expandtab

" 搜索
set incsearch
set showmatch
" 在搜索的时候忽略大小写
set ignorecase

" 高亮显示当前行
set cursorline

" 高亮被搜索的句子（phrases）
set hlsearch
map ,h :nohl<CR>

" 设置在粘贴的时候不自动缩进
set paste 

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
map <F3> :wq <cr>
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
let Tlist_File_Fold_Auto_Close=1	   " 让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_Show_Menu=1                  " 显示taglist菜单
" let Tlist_Auto_Open=1                  " 启动vim自动打开taglist


""""""""""""""""""""""""""""""
" winmanager
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

let g:persistentBehaviour=0 
let g:winManagerWidth=30
let g:defaultExplorer=1
let g:AutoOpenWinManager = 1           "在进入vim时自动打开winmanager
map <F5> :WMToggle <cr>

"""""""""""""""""""""""""""""
" bufexplorer
"""""""""""""""""""""""""""""
map <F6> :BufExplorer <cr>

"""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""
map <F7> :NERDTreeToggle <CR>
