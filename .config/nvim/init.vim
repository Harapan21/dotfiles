if !has('gui_running')
  set t_Co=256
endif

    syntax enable
" syntax on
set relativenumber
set incsearch
set noshowmode
set autoread
set autoindent
set smartindent
set smarttab
set expandtab
set showmatch
set updatetime=300
set signcolumn=yes
set hidden

call plug#begin('~/.vim/plugged')


function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
Plug 'shapeoflambda/dark-purple.vim'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'prettier/vim-prettier', { 'do': 'npm  install' }
Plug 'kevinhui/vim-docker-tools'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'mhinz/vim-mix-format'

if executable('fzf')
  " OSX vs Linux loading (depending on where fzf is)
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Darwin"
    Plug '/usr/local/opt/fzf'
  else
    Plug 'junegunn/fzf', {'dir': '~/.local/src/fzf', 'do': './install --all' }
  endif
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif


if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif


call plug#end()


highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL


highlight UndefinedMarks ctermfg=yellow
autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL

au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo

set fillchars=vert:│


set colorcolumn=101
set cursorline

let mapleader = ","

colo dark_purple


nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <up> <nop>

vnoremap <right> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <up> <nop>


function! Tabbufn()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bn
    else
        :tabnext
    endif
endfunction

function! Tabbufp()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bp
    else
        :tabprev
    endif
endfunction
nnoremap <silent> <S-Left> :call Tabbufp()<CR>
nnoremap <silent> <S-Right>   :call Tabbufn()<CR>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')




nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>






nnoremap <leader>d :vsp<cr>
set splitright
nnoremap <leader>s :split<cr>
set splitbelow



nnoremap <leader>w <C-w>w

nnoremap <leader>] :tabn<cr>
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>T :tabe<cr>

nnoremap <leader>fd "=strftime("%m-%d-%y")<CR>p


tnoremap <Esc> <C-\><C-n>






set showmatch
set splitbelow
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype indent off
au BufNewFile,BufRead *.py
  \ setlocal tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ autoindent
  \ expandtab

set title





set mouse-=a
if !has('nvim')
  set encoding=utf-8
endif




set ignorecase
set smartcase




set textwidth=100
set guicursor=




let g:deoplete#enable_at_startup=1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"




function! NERDTreeToggleFind()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    execute ":NERDTreeClose"
  else
    execute ":NERDTreeFind"
  endif
endfunction





autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>c :call NERDTreeToggleFind()<cr>




let sarsivim = 'sarsi-nvim'
if (executable(sarsivim))
  call rpcstart(sarsivim)
  " nnoremap <leader>l :cfirst<cr>
  nnoremap <leader>f :cnext<cr>
  nnoremap <leader>g :cprevious<cr>
endif



if executable('rg')
  set grepprg=rg\ -i\ --vimgrep

  " Ripgrep on /
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap <leader>/ :Rg<SPACE>
endif





set laststatus=2
let g:airline_left_sep=""
let g:airline_left_alt_sep="|"
let g:airline_right_sep=""
let g:airline_right_alt_sep="|"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number not number of split panes
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1





if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
  set grepprg=rg\ --vimgrep
endif



let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>

  if executable('rg')
    " :Find <term> runs `rg <term>` and passes it to fzf
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)
    nnoremap <leader>/ :Find 
    nnoremap <leader>' :execute "Find " . expand("<cword>")<cr>
  endif
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif

" Racer
let g:racer_cmd = "/Users/harapan/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap <leader>rx <Plug>(rust-doc)
au FileType rust nmap <leader>rd <Plug>(rust-def)
au FileType rust nmap <leader>rs <Plug>(rust-def-split)

let g:rustfmt_autosave = 1


let s:quitting = 0
au QuitPre *.rs let s:quitting = 1
au BufEnter *.rs let s:quitting = 0
au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
au QuitPre *.ts let s:quitting = 1
au BufEnter *.ts let s:quitting = 0
au BufWritePost *.ts if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
let g:neomake_warning_sign = {'text': '?'}
let g:ghci_start_immediately = 1




if !empty(glob('shell.nix'))
  let g:ghci_command = 'nix-shell --command "cabal repl"'
  let g:ghci_command_line_options = ''
else
  let g:ghci_command = 'ghci'
  let g:ghci_command_line_options = '-fobject-code'
endif




let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'go': ['golint', 'gofmt']}
let g:ale_lint_delay = 800
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)



"NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite


" your ~/.vimrc
"
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

let g:NERDSpaceDelims = 1
let g:NERDcompactSexyComs = 1
let g:NERDToggleCheckAllLines =1
let g:NERDDefaultAlign = 'left'
let g:deoplete#sources#rust#racer_binary='/Users/harapan/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='$RUST_SRC_PATH'
let g:deoplete#sources#rust#documentation_max_height=20
nmap <buffer> gd <plug>DeopleteRustGoToDefinitionDefault
nmap <buffer> K  <plug>DeopleteRustShowDocumentation



" Elixir
let g:elixir_maxmenu = 20
let g:elixir_showerroe = 1
let g:mix_format_on_save =1
let g:elixir_autobuild = 1


" javascript
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" ejs
au BufNewFile,BufRead *.ejs set filetype=html


" prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat= 0
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" golang
let g:go_fmt_command = "goimports"
set autowrite
