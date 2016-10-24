" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" GENERAL {

    autocmd! bufwritepost .vimrc source % " Automatic reloading of .vimrc

    set nocompatible    " disable vi compatibility (required for Vundle)
    set history=700     " Number of commands to remember in history
    set autowrite       " Writes on make/shell commands
    set autoread
    set timeoutlen=1000 " Relax, wait for mapped key sequence to be completed

    set clipboard+=unnamed

    set encoding=utf-8

    set tags=./tags;$HOME " walk directory tree up to $HOME looking for tags

" }

" MAPPINGS {

    set pastetoggle=<F2> " toggle paste insert mode

    " be gentle to capitalized commands
    command! W  w
    command! Wq wq
    command! WQ wq
    command! Q  q

    " Open TODOs and FIXMEs found recursively in all files of the current
    " directory in a QuickFix window
    command! Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

    let mapleader = "," " set leader key

    nmap <F7> :NERDTreeToggle<CR>
    nmap <F8> :TagbarToggle<CR>

" }

" FORMATTING {

    set fo+=o " Automatically insert the current comment leader
              " after hitting 'o' or 'O' in Normal mode.
    set fo-=r " Don't automatically insert a comment leader after an enter

    " WRAPPING {
        set nowrap         " Don't wrap automatically on load
        set fo-=t          " Don't wrap automatically on typing
        set textwidth=79   " Document width (used by gd)
        set colorcolumn=80 " Adds a vertical colum at pos 80
    " }

    " Highlight trailing whitespaces
    " MUST be inserted BEFORE the colorscheme command
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/

    set wildmode=longest,list " At command line, complete longest common
                              " string, then list alternatives.

    set backspace=indent,eol,start  " more powerful backspacing

    " INDENTATION {
        set tabstop=8    " Set the default tabstop
        set softtabstop=8
        set shiftwidth=8 " Set the default shift width for indents
        set noexpandtab  " Don't make tabs into spaces (set by tabstop)
        set smarttab     " Smarter tab levels

        set autoindent
        set cindent
        set cinoptions=:s,ps,ts,cs
        set cinwords=if,else,while,do,for,switch,case
        
        vnoremap < <gv  " easier moving of code blocks
        vnoremap > >gv  " visual mode, then press < or > several times
    " }

" }

" VISUAL {

    set number           " Line numbers on
    set showmatch        " Show matching brackets.
    set matchtime=5      " Bracket blinking.
    set novisualbell     " No blinking
    set noerrorbells     " No noise.
    set laststatus=2     " Always show status line.
    set visualbell t_vb= " disable any beeps or flashes on error
        au GuiEnter * set visualbell t_vb=
    set ruler            " Show ruler
    set showcmd          " Display an incomplete command in the lower right
                         " corner of the Vim window

    set shortmess=atI " Shortens messages
    set nolist        " Display unprintable characters f12 - switches
    set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable
                                                             " chars mapping
    set cursorline " hightlight current line

    set scrolloff=10

    " FOLDING {
        set foldenable          " Turn on folding
        "set foldmethod=marker   " Fold on the marker
        set foldmethod=syntax
        "set foldlevel=20         " no autofold
        set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                         " open folds
    " }

    set mouse=a   " Enable mouse
    set mousehide " Hide mouse after chars typed

    set splitbelow
    set splitright

    " COLOR SCHEME FOR NON GVIM {
        if !has('gui_running')
            set t_Co=256
            colorscheme wombat256mod
            highlight ColorColumn ctermbg=233 " must be set after color scheme
        endif
    " }

" }

" VUNDLE {

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'michiwend/vim-colors-pencil'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ctrlpvim/ctrlp.vim'

    Plugin 'Valloric/YouCompleteMe'
    Plugin 'fatih/vim-go'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'airblade/vim-gitgutter'

    call vundle#end()
    filetype plugin indent on

" }

" PLUGIN OPTIONS {

    " AIRLINE {
        let g:airline_powerline_fonts=1
        let g:Powerline_symbols='fancy'
    " }

    " NERDTREE {
        let NERDTreeChDirMode=2
    " }

    " VIM-GO {
        " This trigger takes advantage of the fact that the quickfix window
        " can be easily distinguished by its file-type, qf. The wincmd J
        " command is equivalent to the Ctrl+W, Shift+J shortcut telling Vim to
        " move a window to the very bottom (see :help :wincmd and :help ^WJ).
        autocmd FileType qf wincmd J

        " run current file with ctrl+return
        au FileType go nmap <C-CR> <Plug>(go-run)

        " probably slow
        let g:go_fmt_command = "goimports"
    " }

    " YCM {
        " Auto close preview window after completion
        let g:ycm_autoclose_preview_window_after_completion=1
    " }

    " GITGUTTER {
        nmap <F6> :GitGutterLineHighlightsToggle<CR>
        set updatetime=100
    " }

    " CtrlP {
        let g:ctrlp_cmd = 'CtrlPMRU'
    " }

" }

filetype off
syntax on
