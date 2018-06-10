" === Prelude ===

set nocompatible
filetype off


" === Plugins ===

call plug#begin('~/.vim/bundle')

" Sensible defaults.
Plug 'tpope/vim-sensible'

" Colemak keys.
Plug 'rizo/vim-colemak'

" Incr/decr dates.
Plug 'tpope/vim-speeddating'

" Simple UNIX commands.
Plug 'tpope/vim-eunuch'

" Fzf.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Themes.
Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/spacegray.vim'

" Surround selection.
Plug 'tpope/vim-surround'

" Nice statusline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git gutter.
Plug 'airblade/vim-gitgutter'

" Tagbar.
Plug 'majutsushi/tagbar'

" Comments.
Plug 'scrooloose/nerdcommenter'

" Auto pairs.
Plug 'jiangmiao/auto-pairs'

" File explorer.
Plug 'tpope/vim-vinegar'

" Git integration.
Plug 'tpope/vim-fugitive'

call plug#end()


" === General ===

" Enable file type detection and do indenting.
filetype plugin indent on


" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on.
syntax on

" Default tab settings.
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

" Undo history.
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000


" === Keys ===

" Easier command mode key.
nnoremap ; :
nnoremap : ;

" Set leaders
let mapleader = " "
let maplocalleader = "\\"

" Avoid the escape key.
nnoremap <C-c> :noh<Cr><Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>

" Visual selection maintained when indenting.
vmap <D-]> >gv
vmap <D-[> <gv

" Indent in insert mode.
inoremap <D-]> <c-t>
inoremap <D-[> <c-d>

" Toggle Spell Check Easily
inoremap <D-P> <Esc>:set spell!<Cr>a
nnoremap <D-P> :set spell!<Cr>

" Turbo navigation.
nnoremap H b
nnoremap I w
nnoremap N }
nnoremap E {

nnoremap ´ <C-e>
nnoremap ˜ <C-y>

" Command line
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>

" Resize windows.
nnoremap <C-D-=> :resize +5<CR>
nnoremap <C-D--> :resize -5<CR>
nnoremap <M-C-D-=> :vertical resize +5<CR>
nnoremap <M-C-D--> :vertical resize -5<CR>


" === Editing ===

" Line is not the limit
set whichwrap+=<,>,h,l,[,]


" Wrap text.
set wrap

" Use numbers column for wrap and two spaces for sentences.
set cpoptions=nJ

" Line wrapping symbol
let &showbreak = '  ↳ '

" Remove trailing whitespaces
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Support hidden buffers.
set hidden


" === Navigation ===

" Don't jump on *, helps with find and replace
nnoremap * :keepjumps normal! mi*`i<CR>

" Useful navigation complete bar.
set wildmode=full

" Search options
set ignorecase
set incsearch
set hlsearch
set smartcase

" Infer case in completion.
set infercase

" Open new split panes to right and bottom.
set splitbelow
set splitright


" === UI ===

colorscheme spacegray
set guifont=Fira\ Code:h11
set linespace=1

" No redraw on macros, registers.
set nolazyredraw

" Show matching bracket.
set showmatch

" Show the cursor line in active windows.
set cursorline
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Split separator.
set fillchars+=vert:\    " this comment is here to avoid whitespace elimination

" Show line numbers.
set number

" React faster.
set updatetime=100

" Don't show mode in cmdline.
set noshowmode

if !has('gui_running')
  set t_Co=256
endif


" === Plugins ===

" Surround.
let g:surround_no_mappings = 1
nmap <leader>ds <Plug>Dsurround
nmap <leader>ws <Plug>Csurround
nmap <leader>Ws <Plug>CSurround
nmap <leader>s <Plug>Ysurround
nmap <leader>S <Plug>YSurround
xmap <leader>s <Plug>VSurround
xmap <leader>S <Plug>VgSurround

vmap ( <Plug>VSurround(
vmap ) <Plug>VSurround)
vmap [ <Plug>VSurround[
vmap ] <Plug>VSurround]
vmap { <Plug>VSurround{
vmap } <Plug>VSurround}
vmap " <Plug>VSurround"
vmap ' <Plug>VSurround'
vmap ` <Plug>VSurround`
vmap _ <Plug>VSurround_
vmap * <Plug>VSurround*


" Airline.
let g:airline_powerline_fonts = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 0

" Fzf.
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~20%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" GitGutter.
let g:gitgutter_map_keys = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Tagbar.
let g:tagbar_width = 30
let g:tagbar_compact = 1

" Theme.
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 0

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDUsePlaceHolders = 0
let g:NERDDefaultNesting = 1
let g:NERDAllowAnyVisualDelims = 1
nnoremap <leader>ci :call NERDComment('n', 'insert')<Cr>


" === Languages ===

" OCaml
autocmd FileType ocaml hi EnclosingExpr ctermbg=17 guibg=#223344
autocmd FileType ocaml nmap <buffer> <C-c> :MerlinClearEnclosing<CR>:noh<CR>
autocmd Filetype ocaml let g:AutoPairs = {'(': ')', '[': ']', '{': '}', '"': '"'}
let g:NERDCustomDelimiters = { 'ocaml': { 'left': '(*','right': '*)' } }


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## f5c01b965b95baa0c316d29a74b75b2c ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/rizo/.opam/4.06.1/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
