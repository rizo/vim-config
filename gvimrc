
" === Plugins ===

" Fzf.
macmenu &File.Open\.\.\. key=<nop>
inoremap <D-o> <Esc>:FZF<Cr>
nnoremap <D-o> :FZF<Cr>

" NERDCommenter.
nnoremap <D-/> :call NERDComment('n', 'toggle')<CR>
inoremap <D-/> <Esc>:call NERDComment('i', 'toggle')<CR>
vnoremap <D-/> <Esc>:call NERDComment('v', 'toggle')<CR>




" === UI ===

set macligatures

set showtabline=1
set guioptions=
set guioptions+=e " Show native tabline.
set guioptions+=k " Keep the window size.

