source /apollo/env/envImprovement/var/vimrc

"Pathogen
execute pathogen#infect()
execute pathogen#helptags()

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	   " Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set incsearch           "incremental search"
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.so,*.zip,*.swp

set mouse=a
syntax on               "syntax highlighting"

set hidden

set bg=dark
set number              "sets line numbers"
set ruler               "shows the ruler at the bottom"
set cursorline          "highlights the line that the cursor is on"
set formatprg=par
set lbr
set tw=120

"MISC"
set ic                  "run case insensitive searches by default"
set hlsearch            "turns on search highlighting"
set smartcase
set showmode
set showcmd
set showmatch
set shell=bash
set noerrorbells
set visualbell
set t_vb=
set history=200         "vim command history"

set undodir=~/.vim/undodir
set undofile
set undolevels=1000     "maximum number of changes that can be undone"
set undoreload=10000    "maximum number of lines to save for undo on a buffer reload

"FILETYPE"
filetype on             "Enable filetype detection"
filetype indent on      "Enable filetype-specific indenting"
filetype plugin on      "Enable filetype-specific plugins"

set ofu=syntaxcomplete#Complete
set autoread            "watches for file changes and automatically updates"

set nospell
set spelllang=en        "use english dictionary for spell checks"
set spellsuggest=9      "show only 9 suggestions for misspelled words"

colorscheme Tomorrow-Night

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"TAB AND INDENTATION"
set tabstop=4           "set tab character to 4 characters"
set shiftwidth=2        "set autoindent shift to 2 characters"
set expandtab           "turn tab into whitespace"
set smarttab            "tab and backspace are smart"
set ai                  "turn on auto-indenting"
set si                  "make auto-indenting smarter

compiler gcc
au FileType xhtml,xml so /usr/share/vim/vim73/ftplugin/html_autoclosetag.vim
let g:pydiction_location = '/usr/share/vim/vim73/ftplugin/pydiction/complete-dict'

"Plugins and custom mappings

"Center the screen on the selected word
map N Nzz
map n nzz
"Make it easier to source vimrc
nnoremap <Leader>s :source $MYVIMRC<CR>
"Make it easier to edit vimrc
nnoremap <Leader>v :e $MYVIMRC<CR>
"Map escape to jj to avoid moving to the <esc> key in insert mode
inoremap jj <esc>
"Turn off search highlight
nnoremap <Leader>h :nohl<CR>

"Cycle buffers with ease
nnoremap <F9> :bnext<CR>
nnoremap <C-F9> :bprevious<CR>

"Show Marks"
let g:showmarks_enable = 0
"CtrlP
nnoremap <C-p> :CtrlP<CR>
nnoremap <C-i> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'

"Tabs
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit %<CR>
nnoremap tn :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

"Creating new windows
nnoremap <A-j> :below new<CR>
nnoremap <A-k> :above new<CR>
nnoremap <A-h> :vne<CR>
nnoremap <A-l> :rightb vne<CR>

"Window management
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c
nnoremap <C-o> <C-w>o
nnoremap <C-_> <C-w>_
nnoremap <C-=> <C-w>=
set winminheight=0
set winminwidth=0

"Vimux"
 " Run the current file with rspec
 map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

 " Prompt for a command to run
 map <Leader>vp :VimuxPromptCommand<CR>

 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>

 " Inspect runner pane
 map <Leader>vi :VimuxInspectRunner<CR>

 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>

 " Interrupt any command running in the runner pane
 map <Leader>vx :VimuxInterruptRunner<CR>

"Gundo
nnoremap <F5> :GundoToggle<CR>

"Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"BufExplorer"
let g:bufExplorerShowRelativePath=1

"Change global directory to the current directory of the current buffer
nnoremap <leader>cd :cd %:p:h<CR>

"NERDTree mappings
nnoremap <F2> :NERDTreeToggle<CR>

"Tagbar mappings
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

set tags+=tags;/~

"Auto Commands"

" Automatically cd into the directory that the file is in"
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Restore cursor position to where it was before"
 augroup JumpCursorOnEdit
    au!
       autocmd BufReadPost *
                   \ if expand("<afile>:p:h") !=? $TEMP |
                               \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines."
       autocmd BufWinEnter *
                   \ if exists("b:doopenfold") |
                   \   exe "normal zv" |
                   \   if(b:doopenfold > 1) |
                   \       exe  "+".1 |
                   \   endif |
                   \   unlet b:doopenfold |
                   \ endif
augroup END
