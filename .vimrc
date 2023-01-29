set nu
syntax on
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
" For makefiles
autocmd FileType make setlocal noexpandtab

hi Search term=reverse ctermbg=0 ctermfg=5

set nobackup
set writebackup
set spellfile=~/.vim/spell/.en.add
set vb t_vb=

" Disable filetype-based indentation settings
filetype indent on
" Disable loading filetype-based general configuration
filetype plugin on
" These may be combined for brevity (disabling both)
filetype plugin indent on

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
set <S-F1>=[23~
set <F2>=OQ
set <S-F2>=[24~
set <F3>=OR
set <S-F3>=[25~
set <F4>=OS
"set <F4>=[14~
set <S-F4>=[26~
set <F5>=[15~
set <S-F5>=[28~
set <F6>=[17~
set <S-F6>=[29~
set <F7>=[18~
set <S-F7>=[31~
set <F8>=[19~
set <S-F8>=[32~
set <F9>=[20~
set <S-F9>=[33~
set <F10>=[21~
set <S-F10>=[34~
set <F11>=[23~
set <S-F11>=[23$
set <F12>=[24~
set <S-F12>=[24$

" Programming
    " line movement
map <S-k> kddpk
map <S-j> ddp

    " php
map <F4> oecho "<pre>";print_r();echo "</pre>";die();<ESC>2F)i
map <S-F4> o<?php echo "<pre>";print_r();echo "</pre>";die(); ?><ESC>2F)i

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
map <C-t> :tab sp<CR>


" Enables 8-bit color on 32-bit systems, which I prefer.
"colorscheme peachpuff
" Enables colorscheme for dark backgrounds
colorscheme desert

" Very useful for me :)
cabbrev B <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'b' : 'B')<CR>
cabbrev W <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w' : 'W')<CR>

"map <C-n> :NERDTreeToggle<CR>
"map <C-b> :TlistToggle<CR>
map <C-o> :NnnExplore<CR>



call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'


" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'junegunn/vim-emoji'
"Plug 'https://gitlab.com/gi1242/vim-emoji-ab.git'

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
set completefunc=emoji#complete
set omnifunc=syntaxcomplete#Complete

au FileType html,php,markdown,mmd,text,mail,gitcommit
    \ runtime macros/emoji-ab.vim
