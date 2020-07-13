"Retirado daqui: https://medium.com/@luyo.lemp/acredito-que-muitos-de-voc%C3%AAs-j%C3%A1-tenham-ouvido-falar-sobre-o-vim-eu-particularmente-sempre-tive-e7bd58955a7f

call plug#begin()
"Seção do plugin

Plug 'cseelus/vim-colors-lucid'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"Seção de configuração

"Tema Atual
colorscheme lucid

"Atalhos
let mapleader="\<space>"
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

map <C-\> :NERDTreeToggle<CR>
noremap <C-p> :Files <CR>

noremap <C-s> :w <CR>
noremap <C-f> :Ag <CR> 

"Configs Basicas
set encoding=UTF-8
set ruler
set ttyfast

"TABS
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"Visual Settings
syntax on
set number

"Status Bar
set laststatus=2

"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"ale
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-emmet',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-json', 
    \ 'coc-phpls',
    \ 'coc-yaml',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-jedi',
    \ 'coc-python',
    \   ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort

  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use ctrl+space para comple
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Mude para o modo normal com o esc
tnoremap <Esc> <C-\><C-j>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <c-j> :call OpenTerminal()<CR>

" use alt+hjkl para mover entre split/vsplit paineis

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
