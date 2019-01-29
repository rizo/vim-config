
" # Initialisation

" Be modern.
set nocompatible

" Disable untill plugings are loaded.
filetype off

" Required before loading plugins!
let g:mapleader="\<Space>"
let g:maplocalleader='\'


" # Plugins

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
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/spacegray.vim'
Plug 'rakr/vim-one'
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-gotham'
Plug 'rgrinberg/vim-ocaml'
Plug 'vim-scripts/Wombat'

" Languages.
Plug 'rgrinberg/vim-ocaml'
"Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" Reason
Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'for': 'reason',
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/rizo/.local/bin/reason-language-server.exe'],
    \ }

" Surround selection.
Plug 'tpope/vim-surround'

" Git integration.
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'

" Faster match.
Plug 'itchyny/vim-parenmatch'

" Git signs.
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" Linting
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'


" Nicer statusline.
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'


" Comments.
Plug 'scrooloose/nerdcommenter'

" Auto pairs.
Plug 'jiangmiao/auto-pairs'

" Super tab.
Plug 'ervandew/supertab'

" File explorer.
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Easy alignment for = with <leader-a>
Plug 'junegunn/vim-easy-align'

" Code bookmarks.
Plug 'MattesGroeger/vim-bookmarks'

" No distractions
Plug 'junegunn/goyo.vim'

" Async completion.
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'copy/deoplete-ocaml'

Plug 'metakirby5/codi.vim'


" ## Inactive Plugins

" Highlight current word.
Plug 'xvadim/vim-cursorword', {'branch': 'feature'}
let g:cursorword = 0 " disabled by default

" Tagbar.
" Plug 'majutsushi/tagbar'

" Colors for icons in nerdtree.
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()


" === General ===

" Enable file type detection and do indenting.
filetype plugin indent on

" Use UTF-8.
set encoding=utf-8

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" No swap and backups, please
set noswapfile
set nowritebackup
set nobackup

" Default tab settings.
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

" Block selection
set virtualedit=block

" Undo history.
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Use systems clipboard.
set clipboard=unnamed,unnamedplus




" === Keys ===

" Easier command mode key.
nnoremap ; :
nnoremap : :<Up><Cr>

" Avoid the escape key.
nnoremap <C-c> :noh<Cr><Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>

" Visual selection maintained when indenting.
vmap <D-]> >gv
vmap <D-[> <gv

" Tab navigation.
nnoremap <C-]>  :tabprev<Cr>
nnoremap <C-[>  :tabnext<Cr>

" Indent in insert mode.
inoremap <D-]> <c-t>
inoremap <D-[> <c-d>

" Toggle Spell Check Easily
inoremap <D-P> <Esc>:set spell!<Cr>a
nnoremap <D-P> :set spell!<Cr>

" Turbo navigation.
noremap <silent> N @='5gj'<CR>
noremap <silent> E @='5gk'<CR>

" Navigate between marks.
nnoremap <M-[> <C-o>
nnoremap <M-]> <C-i>

" Command line
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>

" Move between windows.
noremap <C-h> <C-W>h
noremap <C-n> <C-W>j
noremap <C-e> <C-W>k
noremap <C-i> <C-W>l

noremap <C-[> <C-w>W
noremap <C-]> <C-w>w


" Resize windows.
nnoremap <C-D-=> :resize +5<CR>
nnoremap <C-D--> :resize -5<CR>
nnoremap <M-C-D-=> :vertical resize +5<CR>
nnoremap <M-C-D--> :vertical resize -5<CR>


" Jump to the last edited file
nnoremap  <leader><leader> :e .<Cr>

" Go to definition in a split.
nnoremap <leader>gd <C-w>sgd


" === Editing ===

" Line is not the limit
set whichwrap+=<,>,h,l,[,]


" Wrap text.
set wrap

" Break on words.
set linebreak

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

" Less wild wildmenu settings.
set wildmode=full
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*/_build**

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

" Completion options.
set completeopt=longest,menuone

" Hide preview after completion or when leaving insert.
" autocmd InsertLeave * silent! pclose!


" === UI ===

" Theme options.
set t_Co=256                    " Enable 256 color terminal
set termguicolors             " Enable true color
if has('termguicolors')
	set termguicolors             " Enable true color
endif
let base16colorspace=256

set background=dark
colorscheme hybrid

" Switch syntax highlighting on.
syntax on


" Don't show commands.
set noshowcmd

let synmaxcol=80
" set guifont=Fira\ Code:h12
" set guifont=Fura\ Code\ Retina\ Nerd\ Font\ Complete:h11
set guifont=Pragmata\ Pro:h13
set linespace=1

" No redraw on macros, registers.
set lazyredraw

" Cursor color.
highlight Cursor guibg=#DE935F guifg=bg

" Show matching bracket in normal mode.
" set showmatch

" Show the cursor line in active windows.
" set cursorline
" augroup CursorLine
"     au!
"     au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"     au WinLeave * setlocal nocursorline
" augroup END

" Split separator.
" set fillchars+=vert:\    " this comment is here to avoid whitespace elimination
set fillchars+=vert:▏

" Whitespace chars.
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set nolist

" Show line numbers.
set number

set mouse=a

" React faster.
set updatetime=100

" Don't show mode in cmdline.
set noshowmode

" Hide ~
highlight NonText ctermfg=bg guifg=bg

if !has('gui_running')
  set t_Co=256
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
endif

" Window minimum height.
set wmh=0



" # Plugin Configuration

" Surround.
let g:surround_no_mappings = 1
nmap <leader>ds <Plug>Dsurround
nmap <leader>ws <Plug>Csurround
nmap <leader>Ws <Plug>CSurround
nmap <leader>s <Plug>Ysurround
nmap <leader>S <Plug>YSurround
xmap <leader>s <Plug>VSurround
xmap <leader>S <Plug>VgSurround

vmap <leader>( <Plug>VSurround(
vmap <leader>) <Plug>VSurround)
vmap <leader>[ <Plug>VSurround[
vmap <leader>] <Plug>VSurround]
vmap <leader>{ <Plug>VSurround{
vmap <leader>} <Plug>VSurround}
vmap <leader>" <Plug>VSurround"
vmap <leader>' <Plug>VSurround'
vmap <leader>` <Plug>VSurround`
vmap <leader>_ <Plug>VSurround_
vmap <leader>* <Plug>VSurround*


" ## Parenmatch

let g:loaded_matchparen = 1


" ## Bookmarks

highlight link BookmarkSign Label


" ## Deoplete

" Enable deoplete.
let g:deoplete#enable_at_startup = 1

" This is the default, make sure it is not set to "omnifunc" somewhere else.
let g:deoplete#complete_method = "complete"

" Other completion sources suggested to disable.
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

" No delay before completion.
let g:deoplete#auto_complete_delay = 200

let g:deoplete#max_list = 21


" ## Fzf

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_buffers_jump = 0
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Key
inoremap <C-p> <Esc>:FZF<Cr>
nnoremap <C-p> :FZF<Cr>


" ## GitGutter

" let g:gitgutter_map_keys = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" let g:gitgutter_sign_added = '▕▏'
" let g:gitgutter_sign_modified = '▕▏'
" let g:gitgutter_sign_removed = '▕▏'
" let g:gitgutter_sign_removed_first_line = '▕▏'
" let g:gitgutter_sign_modified_removed = '▕▏'
" " let g:gitgutter_sign_removed_first_line = '┃'
" highlight GitGutterDelete guifg=#CC6666
" highlight GitGutterChangeDelete guifg=#DE935F
" nnoremap ]h :GitGutterNextHunk<Cr>
" nnoremap [h :GitGutterPrevHunk<Cr>
" autocmd BufWritePost * GitGutter
" set signcolumn="yes"

" ## Signify

let g:signify_vcs_list               = ['git']
let g:signify_sign_add               = '▕▏'
let g:signify_sign_delete            = '▕▏'
let g:signify_sign_delete_first_line = '▕▏'
let g:signify_sign_change            = '▕▏'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_update_on_focusgained  = 1
let g:signify_line_highlight         = 0
let g:signify_sign_show_count        = 0

highlight clear SignColumn
highlight SignifySignAdd guifg=#5F875F
highlight SignifySignChange guifg=#de935f
highlight SignifySignDelete guifg=#cc6666


" DiffAdd        xxx ctermfg=193 ctermbg=65 guifg=#d7ffaf guibg=#5F875F


" Tagbar (disabled).
" let g:tagbar_width = 30
" let g:tagbar_compact = 1

" Theme.
let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
let g:spacegray_low_contrast = 0


" ## NERDCommenter

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDUsePlaceHolders = 0
let g:NERDDefaultNesting = 1
let g:NERDAllowAnyVisualDelims = 1

" ### Keys
nnoremap <leader>ci :call NERDComment('n', 'insert')<Cr>
nnoremap <C-/> :call NERDComment('n', 'toggle')<CR>
inoremap <C-/> <Esc>:call NERDComment('i', 'toggle')<CR>
vnoremap <C-/> <Esc>:call NERDComment('v', 'toggle')<CR>


" ## NERDTree
let NERDTreeHijackNetrw=1
" let NERDTreeDirArrowExpandable = " "
" let NERDTreeDirArrowCollapsible = " "
let NERDTreeMinimalUI=1
let g:NERDTreeMapOpenSplit = "I"
let g:NERDTreeMapOpenExpl = "E"
let NERDTreeIgnore = ['^_.*']
let g:NERDTreeWinSize=27
let g:NERDTreeStatusline = ""
let g:NERDTreeStatusline = '%#NonText#'
" let NERDTreeDirArrows=0

augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end


" ### Keys
nnoremap <D-0> :NERDTree<CR>
nnoremap <D-e> :NERDTreeToggle<CR><C-w>p
nnoremap <D-E> :NERDTreeFind<CR><C-w>p


" Linting.
" let g:syntastic_check_on_open = 1
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_loc_list_height=15
" let g:syntastic_enable_signs=1
" let g:syntastic_warning_symbol="◆▸◇✖︎✕"
" let g:syntastic_warning_symbol="╳"
" let g:syntastic_error_symbol="╳"
" let g:syntastic_ocaml_checkers=['merlin']

" highlight SyntasticWarningSign guifg=#CC5555
" highlight link SyntasticWarning Error


" ## Lightline

function! LightlineReadonly()
  return &readonly ? ' ' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \       [ 'linter_errors', 'linter_warnings' ] ,
      \       [ 'lineinfo' ],
      \       [ 'percent' ]
      \   ]
      \ },
      \ 'tab': {
      \   'active': [ 'filename', 'modified' ],
      \   'inactive': [ 'filename', 'modified' ]
      \  },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'LightlineFugitive'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = " "
let g:lightline#ale#indicator_errors = " "
let g:lightline#ale#indicator_ok = "\uf00c "

let s:palette = g:lightline#colorscheme#wombat#palette
let s:palette.tabline.tabsel = [ [ '#444444', '#8ac6f2', 252, 66 ] ]
let s:palette.tabline.left = [['#aaaaaa', '#666666', 252, 242]]
unlet s:palette


" ## ALE

let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_max_signs = -1
let g:ale_echo_delay = 100
highlight ALEErrorSign ctermfg=167 guifg=#cc6666
highlight ALEWarningSign ctermfg=167 guifg=#f0c674
" highlight ALEError term=undercurl cterm=undercurl ctermfg=167 ctermbg=52 gui=undercurl guisp=#cc6666
highlight ALEError guibg=#411B1E
highlight ALEWarning guibg=#2A2928

nnoremap <silent> [e <Plug>(ale_previous_wrap)
nnoremap <silent> ]e <Plug>(ale_next_wrap)


" Supertab.
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" EasyAlign
vmap <leader>a <Plug>(EasyAlign)

" Easy alignment for = with <leader-a>
vnoremap <leader>a <Plug>(EasyAlign)

" Fugitive
let g:fugitive_no_maps = 1

" DevIcons
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


" === Languages ===

" OCaml
autocmd FileType ocaml hi EnclosingExpr ctermbg=17 guibg=#b294bb guifg=#000000
autocmd FileType ocaml nnoremap <silent><C-c> :nohlsearch<return>:MerlinClearEnclosing<return><esc>
autocmd Filetype ocaml let b:cursorword_blacklist = ['let', 'type', 'module', 'match', 'with', 'struct', 'if', 'then', 'else']
autocmd Filetype ocaml let g:AutoPairs = {'(': ')', '[': ']', '{': '}', '"': '"'}
let g:NERDCustomDelimiters = { 'ocaml': { 'left': '(*','right': '*)' },
                             \ 'fold': { 'left': '(*','right': '*)', 'nested': 1, 'leftAlt': '//', 'nestedAlt': 1 } }

" Merlin
let no_ocaml_maps = 0
let g:merlin_disable_default_keybindings = 1
autocmd Filetype ocaml noremap  <Leader>t :MerlinTypeOf<return>
autocmd Filetype ocaml noremap  <Leader>n :MerlinGrowEnclosing<return>
autocmd Filetype ocaml noremap  <Leader>p :MerlinShrinkEnclosing<return>
autocmd Filetype ocaml vnoremap <Leader>t :MerlinTypeOfSel<return>
autocmd Filetype ocaml nnoremap <silent>gd  :MerlinLocate<return>
autocmd Filetype ocaml vmap <silent><buffer> <TAB>         :<C-u>MerlinPhrase<return>


" ???

" Don't yank on paste
vnoremap v "_dP


" OCaml
set rtp+=/home/rizo/.opam/default/share/ocp-indent/vim
set rtp+=/home/rizo/.opam/default/share/ocp-index/vim
set rtp+=/home/rizo/.opam/default/share/merlin/vim

