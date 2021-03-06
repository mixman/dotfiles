set nocompatible               " be iMproved
filetype off                   " required

let $FZF_DEFAULT_COMMAND='ag -g ""'
" brew install fzf
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
call plug#end()
" :PlugInstall

"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'Raimondi/delimitMate'
"Plugin 'tpope/vim-surround'

" TODO: fork Align and remove keymaps
" Plugin 'Align'
" Plugin 'luochen1990/rainbow'

filetype plugin indent on

" yank to * register
set clipboard=unnamed

set ttyfast

let g:quickrun_no_default_key_mappings = 1
"let g:tlist_javascript_settings = 'javascript;o:object;f:function'
let g:tlist_javascript_settings = 'js;o:object;f:function'
" Default file encoding for new files
setglobal fenc=utf-8
set encoding=utf-8

" general things
set nocompatible
set backspace=indent,eol,start
syntax on

" make Python syntax highlighting highlight more things
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
autocmd BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,do,switch,with,try,except,finally,def,class
autocmd BufRead *.py inoremap # X<c-h>#<space>

" kill error bells entirely
set noerrorbells
set novisualbell
set t_vb=

set history=100
set ruler
set showmatch
"runtime macros/matchit.vim " matches if/elseif/else as well as brackets
set lbr " wraps at words instead of at characters
set autoread " refresh changed files automatically

" stuff for searching
set ignorecase
set smartcase
set hlsearch
set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line:

" autocomplete when opening files. behaves somewhat similarly to bash.
" - AddWildIgnore ran at end of .vimrc
set wildignore=tags,*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe,*.gif,*.png,*.jpg,*.jpeg
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc
set wildmenu
set wildmode=list:longest,full
set infercase
set completeopt=longest,menu,menuone

" omnicomplete on ctrl-l
inoremap <C-l> <C-x><C-o>
set complete+=.
set complete+=k
set complete+=b
set complete+=t
set completeopt+=menuone,longest
set ofu=syntaxcomplete#Complete

" write code like a boss without parens getting in the way
"inoremap <S-Tab> <esc>la
inoremap <C-e> <C-o>a

" by default, use tabs, display tabstabs are four spaces, and we use tabs
set tabstop=4 " alias ts
set shiftwidth=4 " alias sw
set softtabstop=4 " alias sts
set expandtab " alias: et
set autoindent

au BufRead,BufNewFile *.py setlocal sw=4 sts=4 ts=4
" Haskell indenting :/
au BufRead,BufNewFile *.hs setlocal sw=4 sts=4 ts=4
" in Ruby and Scala, we use spaces (two) instead of tabs
au BufRead,BufNewFile *.rb,*.scala setlocal sw=2 sts=2 ts=8
" Is this needed? They're defaults.
au BufRead,BufNewFile *.css,*.c,*.java setlocal sw=4 sts=4 ts=4
" JS, YAML, HTML (embedded JS these days)
au BufRead,BufNewFile *.js,*yml,*.html setlocal sw=2 sts=2 ts=2
" new HTML files get automatic boilerplate
" au BufNewFile *.html 0r ~/.vim/templates/template.html

" backups and swap files go in .vim
" ending with the double slash includes the full path in the filename
" of the swap files to avoid conflicts
set backupdir=/tmp//
set directory=/tmp//
set nobackup
set nowb
set noswapfile

" must be specified before mapping <leader>
let mapleader = ","

if has('gui_running')
    set scrolloff=999 " scroll keeping cursor in middle of page
    set noantialias
    set background=dark
    colorscheme solarized
    set columns=150
    set guioptions-=m  " hide the menu bar
    set guioptions-=T  " hide the toolbar
    set guioptions-=r  " hide the right-hand scroll bar
    set guioptions-=l  " hide the left-hand scroll bar
    set guioptions-=L  " hide the left-hand scrollbar for splits/new windows
    set guioptions-=R  " hide the right-hand scrollbar for splits/new windows
    " shows/hides menu bar on Ctrl-F1
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    if has('gui_macvim')
        set guifont=Andale\ Mono:h14
        set cmdheight=3 " (sub-optimal) removes many press ENTER to continue prompts
    end
    " search files (works in MacVim)
    map <leader>t :CtrlP<CR>
else
    " vim in terminal
    set scrolloff=999 " scroll keeping cursor in middle of page
    set noantialias
    set cmdheight=2
    " termguicolors works for iterm2, but not macos-terminal
    " set termguicolors
    set t_Co=256
    set background=dark
    let g:impact_transbg=1
    let g:solarized_termcolors=256
    colorscheme solarized
    " search files (does not work in MacVim)
    map <leader>t :FZF<CR>
end

set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•

" GREP
let g:ackprg = 'ag --vimgrep'

" Directory Exploration 
"map <C-Tab> :NERDTreeToggle<CR>
let g:netrw_list_hide = '.pyc,.svn,.egg-info'
" no dollar sign at end of line
set nolist
map <leader>cd :cd %:p:h<CR>
" ESC as C-j
inoremap <C-j> <esc>

" nice-to-haves that slow redraw
set nocursorline
set norelativenumber
" /nice-to-haves
set hidden "not forced to save before switching buffers
map <leader>q <esc>:call CleanClose(0)<CR>
map <S-h> ^
map <S-l> $
set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [%l/%L--%c]\ [%p%%]
set laststatus=2 
"set number
nnoremap <C-space> /

" search for word under cursor
map <leader>vv :Ack! <C-R><C-W><CR>
" search buffers
map <leader>b :CtrlPBuffer<CR>

" fugitive
" remove old fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
let g:Gitv_CommitStep = 100
let g:Gitv_OpenHorizontal = 0
map <leader>a :only<cr>:Gedit<cr>
" gitv
nmap <leader>g :Gitv --all<cr>
nmap <leader>h :Gitv! --all<cr>
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000

" ,v brings up .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

" tagbar
"nnoremap <silent> <F4> :TagbarToggle<CR>

" easygrep
" https://github.com/vim-scripts/EasyGrep/blob/master/doc/EasyGrep.txt
" 2 = all files, 1 = buffers
let g:EasyGrepMode=2

" typing too fast; commands in CAPS work also
command W w
" faster search on finnish keyboard
nmap <space> /

" Y yanks to the end of the line
nmap Y y$
nmap <leader>y "+y
" copy the current line to the clipboard
nmap <leader>Y "+yy
nmap <leader>p "+p

command! -nargs=0 PyTags execute 'silent !ctags -R --languages=Python,JavaScript --python-kinds=-i .'
command! -nargs=0 HsTags execute 'silent !hasktags --ignore-close-implementation --ctags .'
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y
autocmd FileType python set omnifunc=pythoncomplete#Complete
set tags=./tags;/

if &diff
	colorscheme peaksea
	nmap <C-l> <C-W>l
	nmap <C-h> <C-W>h
endif

"map <leader>r <Plug>TaskList
nmap <leader>1 <C-]>
nmap <leader>2 g]

" rainbow parens
let g:rainbow_active = 1 

" PROBLEM: omnicomplete becomes unusably slow with these in path
" http://vim.wikia.com/wiki/Automatically_add_Python_paths_to_Vim_path
"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
    "if os.path.isdir(p):
        "vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF
" set tags+=$HOME/.vim/tags/python.ctags

function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bw".todelbufNr
endfunction

" QuickFix
let g:jah_Quickfix_Win_Height = 10
" toggles the quickfix window.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction
" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
map <F1> :QFix<CR>

" tests
function! RunAllTests(args)
    silent ! echo
    silent ! echo -e "\033[1;36mRunning all unit tests\033[0m"
    silent w
    exec "silent make! %:h" . a:args
endfunction

command! -nargs=* AsyncMake call AsyncMake(<q-args>)
function! AsyncMake(target)
    silent ! echo
    silent ! echo -e "\033[1;36mRunning all unit tests\033[0m"
    silent w
    let make_cmd = &makeprg ." ". a:target
    let vim_func = "OnCompleteLoadErrorFile"
    call asynccommand#run(make_cmd, vim_func)
endfunction

function! JumpToError()
    let has_valid_error = 0
    for error in getqflist()
        if error['valid']
            let has_valid_error = 1
            break
        endif
    endfor
    if has_valid_error
        for error in getqflist()
            if error['valid']
                break
            endif
        endfor
        let error_message = substitute(error['text'], '^ *', '', 'g')
        silent cc!
        exec ":sbuffer " . error['bufnr']
        call RedBar()
        echo error_message
    else
        call GreenBar()
        echo "All tests passed"
    endif
endfunction

function! JumpNoNo()
    let has_valid_error = 0
    for error in getqflist()
        if error['valid']
            let has_valid_error = 1
            break
        endif
    endfor
    if has_valid_error
        for error in getqflist()
            if error['valid']
                break
            endif
        endfor
        let error_message = substitute(error['text'], '^ *', '', 'g')
        let error_message = substitute(error_message, "\n", ' ', 'g')
        let error_message = substitute(error_message, "  *", ' ', 'g')
        call RedBar(error_message)
    else
        call GreenBar("All tests passed")
    endif
endfunction

function! RedBar(msg)
    hi RedBar ctermfg=white ctermbg=red guibg=red guifg=black
    echohl RedBar
    echon a:msg repeat(" ",&columns - strlen(a:msg) - 1)
endfunction

function! GreenBar(msg)
    hi GreenBar ctermfg=white ctermbg=green guibg=green guifg=black
    echohl GreenBar
    echon a:msg repeat(" ",&columns - strlen(a:msg) - 1)
endfunction

function! JumpToTestsForClass()
    exec 'e ' . TestFileForCurrentClass()
endfunction

"nnoremap <leader>t :call RunAllTests('')<cr>:redraw<cr>:call JumpToError()<cr>
"nnoremap <leader>y :call RunAllTests('')<cr>:redraw<cr>:call JumpNoNo()<cr>
"nnoremap <leader>y :AsyncMake %:h<cr>

"set makeprg=unit2\ discover
set makeprg=python\ -m\ unittest

" settings for writing (hjkl works for navigating big block of text)
let s:text_write = 0
function! ToggleTee()
    if s:text_write
        echo "resetting"
        set nolinebreak
        let s:text_write = 0
    else
        nnoremap j gj
        nnoremap k gk
        set linebreak
        echo "j=>gj bindings"
        let s:text_write = 1
    endif
endfunction

"map <leader>ss :call ToggleTee()<CR>

command! -nargs=+ Ack call AckFunc(<q-args>)
function! AckFunc(query)
    let cmd = 'ack -H --nocolor --nogroup --column '
    let cmd .= a:query
	let cmd .= ' | cut -c 1-100'
    let efm = "%f:%l:%c:%m"
    let title = "[Found: %s] Ack"
    let env = asynchandler#quickfix(efm, title)
    "call asynccommand#run(cmd, env)
    call AsyncRun(cmd, env)
endfunction

" Load the output as an error file -- does not jump cursor to quick fix
function! OnCompleteLoadErrorFile(temp_file_name)
    exec "cgetfile " . a:temp_file_name
    "cwindow
    redraw!
    call JumpNoNo()
endfunction

" Add wildignores from specified files
" gitignore -- do not want in repo
" vimignore -- do not want in vim
" NOTE: Run :Proj NAME to have project-specific .vimignores in effect
function! AddWildIgnore(filename)
    if filereadable(a:filename)
        let igstring = '.git/*'
        for oline in readfile(a:filename)
            let line = substitute(oline, 's|n|r', '', "g")
            if line =~ '^#' | con | endif
            if line == '' | con  | endif
            if line == 'syntax: glob' | con | endif
            if line =~ '^!' | con  | endif
            if line =~ '^/' | let igstring .= "," . line[1:] . "*" | con | endif
            if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
            let igstring .= "," . line
        endfor
        let execstring = "set wildignore+=".substitute(igstring,'^,','',"g")
        execute execstring
    endif
endfunction

function! SetupVimIgnore()
    for ig in g:ignorefiles
        call AddWildIgnore(ig)
    endfor
endfunction

let g:ignorefiles = ['.gitignore','~/.gitignore','/code/gitignore','/code/vimignore','.vimignore']
call SetupVimIgnore()

command -nargs=1 Code call GoProj(<q-args>, "~/code/")
command -nargs=1 Proj call GoProj(<q-args>, "/code/")
function! GoProj(name, cpath)
py << EOF
import vim
name = vim.eval("a:name")
cpath = vim.eval("a:cpath")
vim.command(":cd %s%s"%(cpath,name))
vim.command(":call SetupVimIgnore()")
EOF
endfunction

