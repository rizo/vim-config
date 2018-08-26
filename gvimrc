
" # Plugin Configuration

" Fzf.
macmenu &File.Print key=<nop>
inoremap <D-p> <Esc>:FZF<Cr>
nnoremap <D-p> :FZF<Cr>

" NERDCommenter.
nnoremap <D-/> :call NERDComment('n', 'toggle')<CR>
inoremap <D-/> <Esc>:call NERDComment('i', 'toggle')<CR>
vnoremap <D-/> <Esc>:call NERDComment('v', 'toggle')<CR>


" # UI

" Font ligatures.
set macligatures

set showtabline=1
set guioptions=
set guioptions+=k " Keep the window size.


" # Terminal
" let g:terminal_ansi_colors=1

