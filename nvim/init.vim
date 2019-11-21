set nocompatible
filetype off

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"""""""""" Plugins

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
  Plug 'BodneyC/VirkSpaces', { 'branch': 'master' }
" Language
  Plug 'justinmk/vim-syntax-extra'
	Plug 'tpope/vim-fugitive'
  Plug 'oguzbilgic/vim-gdiff'
  Plug 'rbong/vim-flog'
  Plug 'junegunn/gv.vim'
" Text manipulation
	Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vim-easy-align'
  Plug 'tmsvg/pear-tree' " or...
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

"""""""""" General interface options

set nocompatible               " run in vim mode
set noequalalways              " Don't equalize panes on close
set hidden                     " Allow hidden buffers
set noexpandtab                " expand tabs into spaces
set tabstop=2                  " indentation leves of normal tabs
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
set tags^=.git/tags            " Add .git project root tags
set scrolloff=1                " # lines below cursor always
set backspace=indent,eol,start " Backspace behaviour
set matchpairs+=<:>            " use % to jump between pairs
set autowrite                  " Automatically write when switching buffers
set ttimeout                   " Set key press timeout options
set ttimeoutlen=50             " Timeout in 50 ms
set splitbelow                 " Default for opening panes
set splitright                 " Default for opening panes
set cul                        " Cursorline
set icm=split                  " Preview substitues
set winblend=16                " Opacity for floating windows
set updatetime=200             " How long to wait before writing swap to disk
set nofoldenable               " Disable folds
set foldmethod=syntax          " Syntactic folding
set spelllang=en_gb            " Spelling file language
set undofile                   " Allow undo file
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set termguicolors              " RGB colors
set background=dark            " Background affects other highlights
set laststatus=2               " Always show status line
set signcolumn=yes             " Always show sign column
syntax on                      " turn on syntax highlighting

colorscheme wal
set notermguicolors

let mapleader="\<Space>"

"""""""""" Plugin settings

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
let NERDTreeIgnore = ['\.git$', 'node_modules', 'vendor', '\.virkspace']

let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,3'

"""""""""" Functions and things

function! s:openNerdTreeIfNotAlreadyOpen()
  if ! (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    NERDTreeToggle
    setlocal nobuflisted
    wincmd w
  endif
endfunction

" On Vim enter, open NERDTree
autocmd VimEnter *
      \   if argc() == 0
      \ |   setlocal nobuflisted
      \ |   call s:openNerdTreeIfNotAlreadyOpen()
      \ |   Startify
      \ | endif
autocmd VimEnter *
      \   if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
      \ |   call s:openNerdTreeIfNotAlreadyOpen()
      \ |   Startify
      \ | endif

" Flog is one of many git plugins, this provides a useful function for this
function! Flogdiff()
  let first_commit = flog#get_commit_data(line("'<")).short_commit_hash
  let last_commit = flog#get_commit_data(line("'>")).short_commit_hash
  call flog#git('vertical belowright', '!', 'diff ' . first_commit . ' ' . last_commit)
endfunction

augroup flog
  autocmd FileType floggraph vno gd :<C-U>call Flogdiff()<CR>
augroup END

" Custom COC format command for visual and normal
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

command! -nargs=0 -range -bar CocFormat call s:CocFormat(<range>, <line1>, <line2>)
vmap <silent> <leader>F  <Plug>(coc-format-selected)
nmap <silent> <leader>F  <Plug>(coc-format)

" Move between buffers easily
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

" Open an FZF command avoiding NERDTree
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

" NERDTree resize to approp. width
function NERDTreeResize()
  let curWin = winnr()
  NERDTreeFocus
  silent! normal! gg"byG
  let maxcol = max(map(split(@b, "\n"), 'strlen(v:val)')) - 3
  exec 'vertical resize' maxcol
  exec curWin 'wincmd w'
endfunction

command! -nargs=0 NERDTreeResize :call NERDTreeResize()

" Use BodneyC's vim-leader-guide
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
xnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" Map some insert mode command to match pais plugin
imap <BS> <Plug>(PearTreeBackspace)
imap <Esc> <Plug>(PearTreeFinishExpansion)
imap <Space> <Plug>(PearTreeSpace)
nmap <silent> <leader>R :RenameWord<CR>
imap ++ <Plug>(PearTreeJump)
inoremap jj <Esc>

" Explorer maps
nnoremap <leader>ce :CocCommand explorer --toggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nr :call NERDTreeResize()<CR>

" ^_ is shorthand for <C-/>, works on selection
map  <Plug>NERDCommenterToggle

" Append lines quickly
nnoremap <silent> [<Leader> :<C-u>call append(line('.') - 1, repeat([''], v:count1))<CR>
nnoremap <silent> ]<Leader> :<C-u>call append(line('.'), repeat([''], v:count1))<CR>

" Move to next/prev diagnostic message
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Write/edit/quit better
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

" Undo/tags window
nnoremap <silent> <leader>U :MundoToggle<CR>
nnoremap <silent> <leader>V :Vista!!<CR>

" Some additional COC mappings
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>l :CocList<CR>
nnoremap <silent> <leader>d :CocList --auto-preview diagnostics<CR>
nnoremap <silent> <leader>s :CocList commands<CR>

" Pmenu, trust me
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
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Formatting
nmap <silent>  <C-m> <Plug>(coc-cursors-position)
xmap <silent>  <C-m> <Plug>(coc-cursors-range)
nmap <leader>x <Plug>(coc-cursors-operator)

" Highlights, need PyGTK
command! RGBPicker :call CocAction('pickColor')<CR>
command! RGBOptions :call CocAction('colorPresentation')<CR>
command! -nargs=0 RenameWord CocCommand document.renameCurrentWord

" F-keys
nnoremap <F1> :help <C-r><C-w><CR>
nnoremap <F2> :s//g<Left><Left>
nnoremap <F3> :%s//g<Left><Left>
nnoremap <F7> :set spell!<CR>
inoremap <F7> <esc>:set spell!<CR>a

" Buffers
nnoremap <Tab>    :bn<CR>
nnoremap <S-Tab>  :bp<CR>
nnoremap <silent> <leader>bd :bn<CR>:bd#<CR>
nnoremap <silent> <leader>bl :call FZFOpen(':Buffer')<CR>
nnoremap <silent> <leader>bD :%bd\|e#\|bn\|bd<CR>
nnoremap <silent> <leader>be :enew<CR>
nnoremap <silent> <leader>b# <C-^>

" Open file/links
nnoremap <silent> <leader>ox :call netrw#BrowseX(expand('<cfile>'),netrw#CheckIfRemote())<CR>
vnoremap <silent> <leader>ox :<C-u>call netrw#BrowseXVis()<CR>
nnoremap <silent> <leader>of :e <cfile><CR>

" Moving lines up and down
xnoremap <S-up>   :m-2<CR>gv=gv
xnoremap <S-down> :m'>+<CR>gv=gv
nnoremap <S-up>   :m-2<CR>
nnoremap <S-down> :m+<CR>
inoremap <S-up>   <Esc>:m-2<CR>
inoremap <S-down> <Esc>:m+<CR>

" Indenting
xnoremap <       <gv
xnoremap >       >gv
xnoremap <S-Tab> <gv
xnoremap <Tab>   >gv

" Pesky windows line endings...
command! -nargs=0 ConvLineEndings %s///g

""""""" AuGroups

augroup vimrc_nerdtree
  autocmd!
  " Turn off signcolumn
  autocmd FileType nerdtree setlocal signcolumn=no
  autocmd StdinReadPre * let s:std_in=1
  " Close NERDTree on quit
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Indentlines disable for startify
augroup vimrc_startify
  autocmd!
  autocmd FileType startify IndentLinesDisable
augroup END

" Change indent of file
function! ChangeIndent(n)
	set noet
	%retab!
  let &l:ts=a:n
  set expandtab
	%retab!
  call SetIndent(a:n)
endfunction
command! -nargs=1 ChangeIndent call ChangeIndent(<f-args>)

" Set indent width (virtually)
function! SetIndent(n)
  let &l:ts=a:n
  let &l:sw=a:n
  IndentLinesDisable
  IndentLinesEnable
endfunction
command! -nargs=1 SetIndent call SetIndent(<f-args>)

" Update all the things, may change your pwd
function! UpdateAll()
  PlugUpgrade
  PlugUpdate
  CocUpdateSync
  UpdateRemotePlugins
endfunction
command! -nargs=0 UpdateAll call UpdateAll()

" Assures these extension to COC are added
call coc#add_extension(
      \ 'coc-explorer',
			\ 'coc-git',
			\ 'coc-python',
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

" Highlight words matching current
autocmd CursorHold * silent call CocActionAsync('highlight')

"""""""" Terminal Stuff

" Continuously spawn right terminals
function! ChooseTerm(termname)
  let pane = bufwinnr(a:termname)
  if pane == -1
    vsplit
		wincmd J
    resize 10
    terminal
    exe "f " a:termname
		set hidden
    startinsert
  else
    exe pane . "wincmd w"
    vsplit
    terminal
		set hidden
  endif
endfunction

nnoremap <silent> <leader>' :call ChooseTerm("term-bottom")<CR>

tnoremap <LeftRelease> <Nop>
tnoremap <Esc> <C-\><C-n>

augroup vimrc_feature_terminal
  autocmd!
  autocmd TermOpen,TermEnter * setlocal nospell nobuflisted nonu nornu tw=0 wh=1
  autocmd BufEnter,BufWinEnter,WinEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

" Remember the last position when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif
endif

