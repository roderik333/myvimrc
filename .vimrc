" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

syntax enable 

let g:mapleader = ' '
let g:maplocalleader = ','

" Everything and the kitchen sink
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp//,.
set clipboard=unnamedplus
set complete+=kspell
set completeopt=menuone,longest
set directory=/tmp//,.
set encoding=utf-8
set expandtab
set fileformat=unix
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set noswapfile
set noshowmode
set number relativenumber
set regexpengine=1
set ruler
set shiftwidth=4
set showcmd
set showmatch
set shortmess+=c
set softtabstop=4
set scrolloff=5
set smartcase
set splitbelow
set splitright
set tabstop=4
set textwidth=0
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
set ttyfast
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap


call plug#begin('~/.vim/plugged')
Plug 'vim-python/python-syntax'
Plug 'othree/html5.vim'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'Valloric/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kiteco/vim-plugin'
Plug 'tmux-plugins/vim-tmux'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
"Plug 'vim-syntastic/syntastic'
"Plug 'nvie/vim-flake8'

call plug#end()

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

filetype on
filetype plugin indent on

" let g:ale_virtualenv_dir_names = []
" let g:ale_linters_explicit = 1

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" always show the status bar

set bg=dark
colorscheme gruvbox

" let g:airline_theme='gruvbox'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

" au InsertEnter * hi Normal term=NONE ctermbg=darkblue guibg=yellow "
" au InsertLeave * hi Normal term=NONE ctermbg=236 guibg=white "

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})


" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" mouse
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" filetype on
" filetype plugin indent on


" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'

nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <leader>n :NERDTreeToggle<CR>

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" tags
map <leader>t :TagbarToggle<CR>

" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" moving emacs like
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A
" inoremap <M-f> <ESC><Space>Wi
inoremap <M-b> <Esc>Bi
inoremap <M-d> <ESC>cW

"..................................................
" Spellcheck
" .................................................
" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" inoremap <silent> <F5> <c -O>:call SpellToggle()<cr>
" map <silent> <F5> :call SpellToggle()<cr>
function SpellToggle()
    if &spell == 1
            set nospell
        else
            set spell
            set spelllang=nb ",nn,en_us
    endif
endfunction
" nnoremap <silent> <Leader>s :call SpellToggle()<CR>


" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" WhicKey
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ 'b' : ['CtrlPBuffer', 'Bufferlist'] ,
      \ 'e' : [':tabnew $MYVIMRC', 'Edit vimrc in new tab'],
      \ }
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map['s'] = {
      \ 'name': '+spellcheck',
      \ 't': [':call SpellToggle()', 'toggle-spell'],
      \ 'n': [':setlocal spelllang=nb', 'switch-to-norwegian-dictionary'], 
      \ 'e': [':setlocal spelllang=en', 'switch-to-english-dictionary'], 
      \ 'p': [':normal! mz[s1z=`z<CR>', 'replace last misspelled word'], 
      \}

let g:which_key_map['r'] = {
    \ 'name': '+replace',
    \ 'r': [':%s///g<left><left>', 'replace-under-cursor'],
    \ 'q': [':%s///gc<left><left><left>', 'query-replace-under-cursor'],
    \ 'v': [':s///g<left><left>', 'replace-in-selection'],
    \ 'x': [':s///gc<left><left><left>', 'query-replace-in-selection']
    \}

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" kite stuff
let g:kite_tab_complete = 1 
let g:kite_return_complete = 1
set completeopt+=menuone
set completeopt+=noselect
" set completeopt+=noinsert
" set completeopt+=preview

autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg
 
" set aa to be aa again
let g:AutoPairsShortcutFastWrap = "<C-f>"

:autocmd InsertEnter,InsertLeave * set cul!

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

fun! ReplaceAll()
    " Don't do anything if there isn't a search pattern.
    if @/ is# '' 
        return
    endif

    " Save view state and wrapscan setting.
    let l:save = winsaveview()
    let l:old_ws = &wrapscan

    try
        " Make sure search won't wrap around.
        set nowrapscan

        while 1
            " Go to next match and select.
            let l:pos = getpos('.')
            try
                normal! n
            catch
                " E385: search hit BOTTOM without match for: xzxxx
                " Also catch other errors.
                break
            endtry

            " Position unchanged; shoudn't happen AFAIK, but better
            " check otherwise you're going to end up in an infinite
            " loop!
            if getpos('.') == l:pos
                break
            endif

            " Apply last edit command.
            normal! .
        endwhile
    finally
        " Restore view.
        call winrestview(l:save)
        let &wrapscan = l:old_ws
    endtry
endfun

"..................................................
" plasticboy/vim-markdown
" .................................................
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css=fnameescape($HOME).'/.local/lib/github-markdown-css/github-markdown.css'

" Seamlessly treat visual lines as actual lines when moving around.
" noremap j gj
" noremap k gk
" noremap <Down> gj
" noremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk


" Cycle through splits.
nnoremap <S-Tab> <C-w>w


