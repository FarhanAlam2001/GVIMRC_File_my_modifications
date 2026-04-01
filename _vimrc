" ---------------------------
" Basic Vim Enhancements
" ---------------------------
source $VIMRUNTIME/vimrc_example.vim

" ---------------------------
" Basic Settings
" ---------------------------
set mouse=a
syntax enable           " Enable syntax highlighting
set termguicolors       " Enable true colors for modern terminals
colorscheme darkblue    " Keep your dark blue theme

" ---------------------------
" Indentation & Tabs
" ---------------------------
set tabstop=5           " A Tab = 5 spaces visually
set shiftwidth=5        " Indent by 5 spaces
set softtabstop=5       " Pressing Tab inserts 5 spaces
set expandtab           " Convert tabs to spaces
set autoindent          " 

" ---------------------------
" Key Mappings
" ---------------------------
nnoremap <C-s> :w<CR>

" Compile and run C++17 in a new Windows terminal
nnoremap <F5> :w<CR>:!start cmd /k g++ -std=c++17 "%:p" -o "%:p:r" && "%:p:r"<CR>

" Compile and run C++20
nnoremap <F6> :w<CR>:!start cmd /k g++ -std=c++20 "%:p" -o "%:p:r" && "%:p:r"<CR>

" Compile and run C++23
nnoremap <F7> :w<CR>:!start cmd /k g++ -std=c++23 "%:p" -o "%:p:r" && "%:p:r"<CR>

" ---------------------------
" Diff Settings
" ---------------------------
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase'  | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif

  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')

  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')

  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')

  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif

  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3

  if exists('l:shxq_sav')
    let &shellxquote = l:shxq_sav
  endif
endfunction

" ---------------------------
" Clipboard Paste
" ---------------------------
" Ctrl+V to paste from system clipboard in normal, insert, and visual mode
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
vnoremap <C-v> "+p

" ---------------------------
" Select All
" ---------------------------
" Ctrl+A to select all text
nnoremap <C-a> ggVG
vnoremap <C-a> ggVG          " (please don't delete it any)
" --- Enable horizontal scrollbar and disable line wrapping ---
set nowrap
set guioptions+=br