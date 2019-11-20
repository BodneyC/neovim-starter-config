set nocompatible
filetype off

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
" Completion
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-liquid'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
" Interface
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'scrooloose/nerdtree-project-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'mhinz/vim-startify'
  Plug 'Yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'https://gitlab.com/BodneyC/VirkSpaces', { 'branch': 'master' }
" Language
  Plug 'justinmk/vim-syntax-extra'
  Plug 'oguzbilgic/vim-gdiff'
  Plug 'rbong/vim-flog'
  Plug 'junegunn/gv.vim'
" Text manipulation
  Plug 'junegunn/vim-easy-align'
  Plug 'tmsvg/pear-tree'
  " Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-repeat' " Better . functionality
  Plug 'tpope/vim-surround' " Surround with ys<w>
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'simnalamburt/vim-mundo'
  Plug 'liuchengxu/vista.vim'
  Plug 'bodneyc/vim-leader-guide'
" Colorschemes
	Plug 'dylanaraps/wal.vim'
call plug#end()

set nocompatible               " run in vim mode
set noequalalways
set hidden
set expandtab                  " expand tabs into spaces
set tabstop=4                  " indentation leves of normal tabs
set softtabstop=0              " indentation level of soft-tabs
set shiftwidth=0               " how many columns to re-indent with << and >>
set autoindent                 " auto-indent new lines
set breakindent                " Indent on wrap
set breakindentopt=shift:1     " Wrap indent of 1
set smartindent                " return ending brackets to proper locations
set ruler                      " show cursor position at all times
set hls                        " don't highlight the previous search term
set nu rnu                     " turn on line numbering
set wrap                       " turn on visual word wrapping
set linebreak                  " only break lines on 'breakat' characters
set laststatus=2               " Always display
set mouse=a                    " Enable mouse
set bs=2                       " fix backspace on some consoles
set tags^=.git/tags
set scrolloff=1                " # lines below cursor always
set backspace=indent,eol,start " Backspace behaviour
set matchpairs+=<:>            " use % to jump between pairs
set autowrite                  " Automatically write when switching buffers
set ttimeout
set ttimeoutlen=50
set splitbelow
set splitright
set cul
set icm=split
set winblend=16
set updatetime=200
set nofoldenable
set foldmethod=syntax
set spelllang=en_gb
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set termguicolors
set background=dark
set laststatus=2
set signcolumn=yes
syntax on                      " turn on syntax highlighting

colo wal

if has("autocmd") " Last position when opening file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif
endif

let mapleader="\<Space>"

let g:virk_tags_enable = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_enabled = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
let g:mundo_right = 1
let g:gutentags_add_default_project_roots = 0 
let g:gutentags_project_root = ['package.json', '.git', '.virkspace'] 
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/') 
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1 
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0 
let g:gutentags_ctags_extra_args = [ '--tag-relative=yes', '--fields=+ailmnS', ] 
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista#renderer#icons = { "function": "\uf794", "variable": "\uf71b" }
let g:vista_executive_for = { 'vim': 'ctags' }
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:pear_tree_map_special_keys = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let NERDTreeWinSize=25
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=0
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,3'
" let NERDTreeIgnore = ['\.git$', 'node_modules', 'vendor', '\.virkspace']

function! s:openNerdTreeIfNotAlreadyOpen()
  if ! (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    NERDTreeToggle
    setlocal nobuflisted
    wincmd w
  endif
endfunction

function! Flogdiff()
  let first_commit = flog#get_commit_data(line("'<")).short_commit_hash
  let last_commit = flog#get_commit_data(line("'>")).short_commit_hash
  call flog#git('vertical belowright', '!', 'diff ' . first_commit . ' ' . last_commit)
endfunction
augroup flog
  autocmd FileType floggraph vno gd :<C-U>call Flogdiff()<CR>
augroup END

function! s:CocFormat(range, line1, line2) abort
  if a:range == 0
    call CocAction('format')
  else
    call cursor(a:line1, 1)
    normal! V
    call cursor(a:line2, 1)
    call CocAction('formatSelected', 'V')
  endif
endfunction

function! WinMove(k)
  let t:curwin = winnr()
  exec "wincmd " . a:k
  if(a:k == 'h' || expand('%') == '[coc-explorer]')
    return
  endif
  if(t:curwin == winnr())
    if(match(a:k, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd " . a:k
  endif
endfunction
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
inoremap <C-h> <Esc><C-h>
inoremap <C-j> <Esc><C-j>
inoremap <C-k> <Esc><C-k>
inoremap <C-l> <Esc><C-l>

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
nnoremap <silent> <leader>; :Commands<CR>
nnoremap <silent> <leader>f :call FZFOpen(":call fzf#vim#files('', fzf#vim#with_preview({}, 'up:70%'))")<CR>
nnoremap <silent> <leader>r :call FZFOpen(':Rg')<CR>
nnoremap <silent> <leader>m :call FZFOpen(':Marks')<CR>
nnoremap <silent> <leader>M :call FZFOpen(':Maps')<CR>
nnoremap <silent> <leader>i :IndentLinesToggle<CR>

function NERDTreeResize()
  let curWin = winnr()
  NERDTreeFocus
  silent! normal! gg"byG
  let maxcol = max(map(split(@b, "\n"), 'strlen(v:val)')) - 3
  exec 'vertical resize' maxcol
  exec curWin 'wincmd w'
endfunction
command! -nargs=0 NERDTreeResize :call NERDTreeResize()

nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
xnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

imap <BS> <Plug>(PearTreeBackspace)
imap <Esc> <Plug>(PearTreeFinishExpansion)
imap <Space> <Plug>(PearTreeSpace)
nmap <silent> <leader>R :RenameWord<CR>
imap ++ <Plug>(PearTreeJump)
inoremap jj <Esc>

nnoremap <leader>ce :CocCommand explorer --toggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nr :call NERDTreeResize()<CR>

map  <Plug>NERDCommenterToggle

nnoremap <silent> [<Leader> :<C-u>call append(line('.') - 1, repeat([''], v:count1))<CR>
nnoremap <silent> ]<Leader> :<C-u>call append(line('.'), repeat([''], v:count1))<CR>
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)


nnoremap Q   q
nnoremap Q!  q!
command! Wqa wqa
command! WQa wqa
command! WQ  wq
command! Wq  wq
command! W   w
command! Q   q
nnoremap <leader>W :wqa<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>E :e!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<left><left>
nnoremap <leader>/ :noh<CR>
nnoremap <silent> <leader>" :sbn<CR>
nnoremap <silent> <leader>% :vert sbn<CR>

nnoremap <silent> <leader>U :MundoToggle<CR>
nnoremap <silent> <leader>V :Vista!!<CR>

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>l :CocList<CR>
nnoremap <silent> <leader>d :CocList --auto-preview diagnostics<CR>
nnoremap <silent> <leader>s :CocList commands<CR>

""""""" Pmenu
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"
inoremap <silent><expr> <Tab>
      \ pumvisible()
      \   ? "\<C-n>"
      \   : <SID>check_back_space()
      \     ? "\<Tab>"
      \     : coc#refresh()
inoremap <silent><expr> <CR>
      \ pumvisible()
      \   ? "\<C-y>"
      \   : pear_tree#insert_mode#PrepareExpansion()

""""""" Formatting
command! -nargs=0 -range -bar CocFormat call s:CocFormat(<range>, <line1>, <line2>)
vmap <silent> <leader>F  <Plug>(coc-format-selected)
nmap <silent> <leader>F  <Plug>(coc-format)
nmap <silent>  <C-m> <Plug>(coc-cursors-position)
xmap <silent>  <C-m> <Plug>(coc-cursors-range)
nmap <leader>x <Plug>(coc-cursors-operator)

""""""" Highlights
command! RGBPicker :call CocAction('pickColor')<CR>
command! RGBOptions :call CocAction('colorPresentation')<CR>
command! -nargs=0 RenameWord CocCommand document.renameCurrentWord

""""""" F-keys
nnoremap <F1> :help <C-r><C-w><CR>
nnoremap <F2> :s//g<Left><Left>
nnoremap <F3> :%s//g<Left><Left>
nnoremap <F7> :set spell!<CR>
inoremap <F7> <esc>:set spell!<CR>a

""""""" Buffers
nnoremap <Tab>    :bn<CR>
nnoremap <S-Tab>  :bp<CR>
nnoremap <silent> <leader>bd :bn<CR>:bd#<CR>
nnoremap <silent> <leader>bl :call FZFOpen(':Buffer')<CR>
nnoremap <silent> <leader>bD :%bd\|e#\|bn\|bd<CR>
nnoremap <silent> <leader>be :enew<CR>
nnoremap <silent> <leader>b# <C-^>

""""""" Open file/links
nnoremap <silent> <leader>ox :call netrw#BrowseX(expand('<cfile>'),netrw#CheckIfRemote())<CR>
vnoremap <silent> <leader>ox :<C-u>call netrw#BrowseXVis()<CR>
nnoremap <silent> <leader>of :e <cfile><CR>

""""""" Moving lines up and down
xnoremap <S-up>   :m-2<CR>gv=gv
xnoremap <S-down> :m'>+<CR>gv=gv
nnoremap <S-up>   :m-2<CR>
nnoremap <S-down> :m+<CR>
inoremap <S-up>   <Esc>:m-2<CR>
inoremap <S-down> <Esc>:m+<CR>

""""""" Indenting
xnoremap <       <gv
xnoremap >       >gv
xnoremap <S-Tab> <gv
xnoremap <Tab>   >gv

command! -nargs=0 ConvLineEndings %s///g

augroup vimrc_nerdtree
  autocmd!
  autocmd FileType nerdtree setlocal signcolumn=no
  autocmd StdinReadPre * let s:std_in=1
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

augroup vimrc_startify
  autocmd!
  autocmd FileType startify IndentLinesDisable
augroup END

augroup vimrc_language_other
  autocmd!
  autocmd BufEnter,BufWinEnter,WinEnter Jenkinsfile,Dockerfile set ts=4 | set sw=4
augroup END

function! ChangeIndent(n)
	set noet
	%retab!
  let &l:ts=a:n
  set expandtab
	%retab!
  call SetIndent(a:n)
endfunction
command! -nargs=1 ChangeIndent call ChangeIndent(<f-args>)

function! SetIndent(n)
  let &l:ts=a:n
  let &l:sw=a:n
  IndentLinesDisable
  IndentLinesEnable
endfunction
command! -nargs=1 SetIndent call SetIndent(<f-args>)

function! GetHighlightTerm(group, ele)
  let higroup = execute('hi ' . a:group)
  return matchstr(higroup, a:ele.'=\zs\S*')
endfunction
command! -nargs=+ GetHighlightTerm call GetHighlightTerm(<f-args>)

function! UpdateAll()
  let l:cwd = getcwd()
  PlugUpgrade
  PlugUpdate
  CocUpdateSync
  UpdateRemotePlugins
  exec 'cd ' . l:cwd
endfunction
command! -nargs=0 UpdateAll call UpdateAll()

call coc#add_extension(
      \ 'coc-explorer',
      \ 'coc-snippets',
      \ 'coc-tag',
      \ 'coc-syntax',
      \ 'coc-lists',
      \ 'coc-yank',
      \ 'coc-diagnostic',
      \ 'coc-docker',
      \ 'coc-sh',
      \ 'coc-json', 
      \ 'coc-tsserver', 
      \ 'coc-tslint-plugin',
      \ 'coc-go',
      \ 'coc-html', 
      \ 'coc-emmet', 
      \ 'coc-css',
      \ 'coc-highlight',
      \ 'coc-terminal')

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! ChooseTerm(termname)
  let pane = bufwinnr(a:termname)
  if pane == -1
    split
    resize 10
    terminal
    exe "f " a:termname
    startinsert
  else
    exe pane . "wincmd w"
    vsplit
    terminal
  endif
endfunction

nnoremap <silent> <leader>' :call ChooseTerm("term-bottom")<CR>

tnoremap <C-q> <C-\><C-n>
tnoremap <LeftRelease> <Nop>

augroup vimrc_feature_terminal
  autocmd!
  autocmd TermOpen,TermEnter * setlocal nospell nobuflisted nonu nornu tw=0 wh=1
  autocmd BufEnter,BufWinEnter,WinEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

autocmd VimEnter *
      \   if argc() == 0
      \ |   setlocal nobuflisted
      \ |   wincmd w
      \ |   Startify
      \ | endif
autocmd VimEnter *
      \   if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
      \ |   call s:openNerdTreeIfNotAlreadyOpen()
      \ |   Startify
      \ | endif

