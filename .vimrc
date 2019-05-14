syntax on   "语法高亮
set nocompatible  "不与vi兼容
set mouse=a        "支持鼠标
"filetype plugin indent on "开启文件类型检测，并且载入对应的缩进规则。比如py文件
set autoindent     "按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
"set tabstop=2     "按下 Tab 键时，Vim 显示的空格数
set expandtab      "由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set softtabstop=2  "Tab 转为多少个空格
set encoding=utf-8 "编码
set smartindent "开启新行时使用智能自动缩进"

set number  "显示行号
set cursorline  "光标所在的当前行高亮
set laststatus=0 "是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set ruler      "在状态栏显示光标的当前位置（位于哪一行哪一列）
set showmatch   "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set hlsearch    "搜索时，高亮显示匹配结果
set ignorecase  "搜索时忽略大小写
"set spell spelllang=en_us  "打开英语单词的拼写检查
set nowrap      "关闭自动折行

set undofile    "保留撤销历史。
                "Vim 会在编辑时保存操作历史，用来供用户撤消更改。默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了。
                "打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在。这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头

set backupdir=~/.vim/.backup// "设置备份文件、交换文件、操作历史文件的保存位置  结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

set autochdir   "自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录
set history=1000  "Vim 需要记住多少次历史操作
set autoread      "打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示

set listchars=tab:»■,trail:■   "如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set list

set wildmenu                  "命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmode=longest:list,full
"colorscheme industry "设置配色方案 desert是配色方案的名字 可以用gvim选好 再在这里面设置
"colorscheme torte
colorscheme torte

au BufNewFile,BufRead *.py
\ set tabstop=4         "tab宽度
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79      "行最大宽度
\ set expandtab         "tab替换为空格键
\ set autoindent        "自动缩进
\ set fileformat=unix   "保存文件格式


map <F12> :call CompileRunGcc()<CR>    "运行快捷键设置为F5
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        "exec "!time python2 %"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
    exec "!read -p \"按任意键继续\""
endfunc


"这是对'The-NERD-Commenter'插件的配置
let mapleader="," "这一步异常重要！！！！没有就不工作
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward= "s-tab"
let NERDSpaceDelims=1            " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1        " 多行注释时样子更好看
let g:NERDDefaultAlign = 'left'  "将行注释符左对齐

filetype off                  " 这是必需的
" 你在此设置运行时路径
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" 在这里面输入安装的插件 " Vundle 本身就是一个插件 Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

"目录树
Plugin 'The-NERD-tree'

"快速搜索
"Plugin 'FuzzyFinder'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'

" Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'The-NERD-Commenter'
Plugin 'AutoComplPop'
Plugin 'OmniCppComplete'
Plugin 'Mark'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'w0rp/ale'
" Plugin 'vim-scripts/ctags.vim'
" Plugin 'vim-scripts/taglist.vim'
"所有插件都应该在这一行之前
call vundle#end()

"对Mark插件的快捷键配置
nmap mk <Plug>MarkSet
vmap mk <Plug>MarkSet
nmap mm <Plug>MarkClear
vmap mm <Plug>MarkClear
nmap me <Plug>MarkRegex
vmap me <Plug>MarkRegex

"文件树目录快捷键配置
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :CtrlPMixed<CR>

"syntastic
"设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
let g:syntastic_enable_highlighting=1





filetype plugin indent on
