"-----------------------------------------------------------
" Source the default vimrc
"-----------------------------------------------------------
map <C-[> :tag <C-r><C-w><CR>
source ~/.vim/bundle/vimrc
map <C-[> :tag <C-r><C-w><CR>
if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

"-----------------------------------------------------------
" Fuzzy finder plugin
"-----------------------------------------------------------
set rtp+=~/git/fzf

"-----------------------------------------------------------
" Don't show the "Swap file already exists" message
"-----------------------------------------------------------
set shortmess+=A

"-----------------------------------------------------------
" Allow % to jump between match <> tags 
"-----------------------------------------------------------
packadd! matchit

let g:netrw_liststyle = 3

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_path_to_python_interpreter = 'python3'
let g:ycm_server_use_vim_stdout = 0
let g:ycm_complete_in_strings = 0 "Disable #include <... autocomplete

let mapleader = "\\"
set timeoutlen=200
set ttimeoutlen=0
set esckeys

let generate_tags=1

"-----------------------------------------------------------
" Startify splash
"-----------------------------------------------------------
"let g:startify_custom_header=system('type c:\temp\vim_splash.txt')

"personal settings
colorscheme solarized
set background="dark"

if !has ('nvim')
    let g:session_autosave = 'no'
"    let g:zenburn_high_Contrast = 1
"    set gfn=Consolas:h11:cANSI
    set t_Co=256
endif

let MRU_Max_Entries = 1000
"-----------------------------------------------------------
" OmniCppComplete configuration
"-----------------------------------------------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set completeopt=menuone,menu,longest,preview
autocmd FileType python set omnifunc=pythoncomplete#Complete

"-----------------------------------------------------------
" Tlist configuration : Do not auto open at startup
"-----------------------------------------------------------
let Tlist_Auto_Open = 0

"-----------------------------------------------------------
" Jump to in split pane
"-----------------------------------------------------------
map <leader>g <C-w><C-v><C-]>

"-----------------------------------------------------------
" Open vimrc
"-----------------------------------------------------------
map <leader>v <ESC>:e ~/.vimrc<CR>

"-----------------------------------------------------------
" Align at whatever
"-----------------------------------------------------------
map <leader>t :Tab /

"-----------------------------------------------------------
" Undo global vimrc remapping of >, <
"-----------------------------------------------------------
vnoremap > >
vnoremap < <

"-----------------------------------------------------------
" Search only within selected lines
"-----------------------------------------------------------
:vnoremap <M-/> <Esc>/\%V
:vnoremap / <Esc>/\%V

"-----------------------------------------------------------
" Disable vim-session autoloading
"-----------------------------------------------------------
let g:session_autoload = 'no'

"-----------------------------------------------------------
" Reload with f5
"-----------------------------------------------------------
map <f5> :e!<CR>

"-----------------------------------------------------------
" Status bar customization
"-----------------------------------------------------------
set laststatus=2                         " always display status bar
set statusline=%f                        " full filename
"set statusline+=%t                      " tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
"set statusline+=%{&ff}]                 " file format
"set statusline+=%h                      " help file flag
set statusline+=%m                       " modified flag
set statusline+=%r                       " read only flag
"set statusline+=%y                      " filetype
set statusline+=\ %#DiffChange#%{g:project_name}%* " Project name (
      " highlighted )
set statusline+=\ %#DiffChange#%{g:function_name}%* " Project name (
      " highlighted )
set statusline+=%=                       " left/right separator
set statusline+=%c,                      " cursor column
set statusline+=%l/%L                    " cursor line/total lines
set statusline+=\ %P                     " percent through file

"-----------------------------------------------------------
" Allow up to 5 lines of messages before making the person press enter
"-----------------------------------------------------------
set report=5

colorscheme solarized
set background="dark"

map gi :YcmCompleter GoToInclude<CR>
map <C-]> :YcmCompleter GoTo<CR>
map <C-[> :tag <C-r><C-w><CR>
map <leader>e :YcmDiags<CR>
map <leader>i :YcmCompleter FixIt<CR>
set pt=<F10>

unmap <ESC>
"-----------------------------------------------------------
" i dont know why this has to be done in order for commenting to work.
" pathogen should do it
"-----------------------------------------------------------
so ~/.vim/bundle/unsorted_plugins/plugin/grm_comment.vim
let $BASH_ENV = "~/.bash_aliases"

hi Normal ctermbg=none

unmap <C-f>
map <C-f> :FZF<CR>
