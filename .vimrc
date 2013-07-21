set nu
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
" For makefiles
autocmd FileType make setlocal noexpandtab

hi Search term=reverse ctermbg=0 ctermfg=5

set nobackup
set writebackup
set spellfile=~/.vim/spell/.en.add
set vb t_vb=

" Disable filetype-based indentation settings
filetype indent off
" Disable loading filetype-based general configuration
filetype plugin off
" These may be combined for brevity (disabling both)
filetype plugin indent off

let osys=system('uname -s')
if osys == "FreeBSD"
  set t_kb=
  fixdel
elseif osys == "Linux"
  set t_kb=
  fixdel
endif

" Fix colors in windows
set t_Co=8
if has("terminfo")
    let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
    let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
    let &t_Sf="[38;5;%dm"
    let &t_Sb="[48;5;%dm"
endif

" These are needed because for some reason which I cannot
" determine, this system uses non-standard F-Key bindings.
set <F1>=OP
set <F2>=OQ
set <F3>=OR
set <F4>=OS
set <F5>=[15~
set <F6>=[17~
set <F7>=[18~
set <F8>=[19~
set <F9>=[20~
set <S-F9>=[33~
set <F10>=[21~
set <S-F10>=[34~
set <F11>=[23~
set <F12>=[24~

" Programming
    " line movement
map <S-k> kddpk
map <S-j> ddp

    " blocks
map <F9> <ESC>o{<CR>}<ESC>ko
map <S-F9> <ESC>cl<CR>{<CR>}<ESC>k

    " for()
map <F10> oint i=0;<CR>for(i=0;i<n;++i)<CR>{<CR>}<ESC>ko<TAB>

    " if()
map <S-F10> oif()<CR>{<CR>}<ESC>kkllli

    " comments
map <F11> 0i// <ESC> <CR>
map <S-F11> 03x<CR>
map <F12> o/***  ***/<ESC>5ha
map <S-F12> o/*** YOU ARE HERE ***/<ESC>

    " Search
map <C-f> :vim  *.c *.hODODODODODODODOD

" Tabs
map <C-PageDown> :tabn<CR>
map <C-PageUp> :tabp<CR>
map <PageDown> :tabn<CR>
map <PageUp> :tabp<CR>
map <C-j> :wincmd w<CR>
map <C-k> :wincmd W<CR>
map <C-x> 0rx<CR>

" Enables 8-bit color on 32-bit systems, which I prefer.
colorscheme peachpuff


set makeprg=$DART_SDK/bin/dart_analyzer\ --enable_type_checks\ %\ 2>&1\ \\\|\ sed\ 's/file://'
