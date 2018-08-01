set tabstop=2
set shiftwidth=2
set expandtab
set number
set ignorecase
set nowrap
set nobackup
set nowritebackup
set noswapfile
set scrolloff=1
set sidescrolloff=5
set display+=lastline

set pastetoggle=<F2>
nmap <F3> :set invnumber<CR>
nmap <F4> :set invrelativenumber<CR>

au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
execute pathogen#infect()
syntax on

filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:ctrlp_working_path_mode = 'r'

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif
