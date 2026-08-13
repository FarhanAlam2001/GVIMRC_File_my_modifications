" ---------------------------------------------------------------
" Based on the official Vim example vimrc
" (vim/vim runtime/vimrc_example.vim - The Vim Project)
" https://github.com/vim/vim/blob/master/runtime/vimrc_example.vim
" ---------------------------------------------------------------

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" =================================================================
" Custom additions requested by user
" (Everything above this line is the untouched official example)
" =================================================================

" ---------------------------
" Mouse Support
" ---------------------------
set mouse=a

" ---------------------------
" Color Scheme
" ---------------------------
syntax enable
set termguicolors
colorscheme darkblue

" ---------------------------
" Movement Key Mappings (Arrow keys only, as in the reference sheet:
" Left/Down/Up/Right = h/j/k/l)
" ---------------------------
noremap <Left>  h
noremap <Down>  j
noremap <Up>    k
noremap <Right> l

" Disable h j k l so only the arrow keys move the cursor
noremap h <Nop>
noremap j <Nop>
noremap k <Nop>
noremap l <Nop>

" ---------------------------
" Multi-Language Compile & Run
" ---------------------------

" C++23
nnoremap <F7> :w<CR>:!start cmd /k g++ -std=c++23 "%:p" -o "%:p:r" && "%:p:r"<CR>

" C
nnoremap <Leader>e :w<CR>:!start cmd /k gcc "%:p" -o "%:p:r" && "%:p:r"<CR>

" Go
nnoremap <Leader>g :w<CR>:!start cmd /k go run "%:p"<CR>

" Java
nnoremap <Leader>j :w<CR>:!start cmd /k javac "%:p" && java -cp "%:p:h" "%:t:r"<CR>

" C#
nnoremap <Leader>c :w<CR>:!start cmd /k dotnet script "%:p"<CR>

" Python
nnoremap <Leader>p :w<CR>:!start cmd /k python "%:p"<CR>

" Rust
nnoremap <Leader>r :w<CR>:!start cmd /k rustc "%:p" -o "%:p:r" && "%:p:r"<CR>

" JavaScript (Node.js)
nnoremap <Leader>n :w<CR>:!start cmd /k node "%:p"<CR>

" TypeScript
nnoremap <Leader>t :w<CR>:!start cmd /k ts-node "%:p"<CR>

" Kotlin
nnoremap <Leader>k :w<CR>:!start cmd /k kotlinc "%:p" -include-runtime -d "%:p:r.jar" && java -jar "%:p:r.jar"<CR>

" Swift
nnoremap <Leader>s :w<CR>:!start cmd /k swift "%:p"<CR>

" PHP
nnoremap <Leader>h :w<CR>:!start cmd /k php "%:p"<CR>

" Ruby
nnoremap <Leader>b :w<CR>:!start cmd /k ruby "%:p"<CR>