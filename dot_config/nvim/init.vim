set nocompatible
set showmatch
set mouse=v
set hlsearch
set number
set relativenumber
set cc=80
set ttyfast
set noswapfile
set smarttab
set scrolloff=10

let mapleader = " "

syntax on

call plug#begin()

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'andrewradev/tagalong.vim'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

Plug 'rhysd/clever-f.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'


Plug 'jiangmiao/auto-pairs'

Plug 'frazrepo/vim-rainbow'

call plug#end()

" map esc
inoremap jj <Esc>
cnoremap jj <C-C>

" move lines
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

" move between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" save
nnoremap <Leader>w :w<CR>

" quit
nnoremap <Leader>q :q<CR>

" quit
nnoremap <Leader>q :q<CR>

" jump to last buffer
nnoremap <Leader><space> <C-^>

" open terminal
nmap <Leader>t :term<CR>

" open coc-explorer
nmap <space>n <Cmd>CocCommand explorer<CR>

" open yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" coc diagnostic
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc apply codeaction
xmap <leader>a  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a  <Plug>(coc-codeaction-selected)<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Highlight the symbol and its references when holding the cursor. 
autocmd CursorHold * silent call CocActionAsync('highlight')

" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" autocomplete trigger
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" terminal mappings
tnoremap jj <C-\><C-n>

" set colorscheme
let g:gruvbox_contrast_dark='hard'
let g:airline_theme='gruvbox'

colorscheme gruvbox
set background=dark

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Git mapping
nmap <leader>g :G<CR>

" => Windows resizing
nmap <C-left> <C-w>5<
nmap <C-right> <C-w>5>
nmap <C-down> <C-w>5+
nmap <C-up> <C-w>5-

tmap <C-left> <C-w>5<
tmap <C-right> <C-w>5>
tmap <C-down> <C-w>5+
tmap <C-up> <C-w>5-

" Find files using Telescope command-line sugar.
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>r <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:rainbow_active = 1

vnoremap y mxy'x

" Jest test
nnoremap <leader>jt :call CocAction('runCommand', 'jest.singleTest')<CR>
nnoremap <leader>jf :call CocAction('runCommand', 'jest.fileTest')<CR>
nnoremap <leader>jp :call CocAction('runCommand', 'jest.projectTest')<CR>

inoremap <silent><expr> <c-space> coc#refresh()

" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
