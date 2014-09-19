" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" General {

    autocmd! bufwritepost .vimrc source %   " Automatic reloading of .vimrc
    autocmd! bufwritepost .gvimrc source %  " Automatic reloading of .gvimrc

    set nocompatible        " disable vi compatibility. (required for Vundle)
    set history=700         " Number of things to remember in history.
    set autowrite           " Writes on make/shell commands
    set autoread
    set timeoutlen=250      " Time to wait after ESC

    set pastetoggle=<F2>    " toggle paste insert mode
    set clipboard+=unnamed

    set encoding=utf-8

    set tags=./tags;$HOME   " walk directory tree up to $HOME looking for tags


" }

" Mappings {

    " allow uppercase commands
    command! W w
    command! Wq wq
    command! WQ wq
    command! Q q

    nmap <C-s> :w<CR>
    nmap <C-q> :qa<CR>
    nmap <C-t> :tabnew<CR>
    nmap <C><b><g> :echo "hello"<CR>

    " Open TODOs and FIXMEs found recursively in all files of the current
    " directory in a QuickFix window
    command! Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

" }

" Formatting {

    set fo+=o   " Automatically insert the current comment leader
                " after hitting 'o' or 'O' in Normal mode.
    set fo-=r   " Don't automatically insert a comment leader after an enter

    " Wrapping {
        set nowrap          " Don't wrap automatically on load
        set fo-=t           " Don't wrap automatically on typing
        set textwidth=79    " Document width (used by gd)
        set colorcolumn=80  " Adds a vertical colum at pos 80
    " }


    " Show whitespace
    " MUST be inserted BEFORE the colorscheme command
    " autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    " au InsertLeave * match ExtraWhitespace /\s\+$/

    set wildmode=longest,list   " At command line, complete longest common
                                " string, then list alternatives.

    set backspace=indent,eol,start  " more powerful backspacing

    " Indentation {
        set tabstop=4       " Set the default tabstop
        set softtabstop=4
        set shiftwidth=4    " Set the default shift width for indents
        set expandtab       " Make tabs into spaces (set by tabstop)
        set smarttab        " Smarter tab levels

        set autoindent
        set cindent
        set cinoptions=:s,ps,ts,cs
        set cinwords=if,else,while,do,for,switch,case

        vnoremap < <gv  " easier moving of code blocks
        vnoremap > >gv  " visual mode, then press < or > several times
    " }

    syntax on   " enable syntax
    filetype off
    "filetype plugin indent on   " Automatically detect file types.
    " --> added after vundle!

" }

" Visual {

    set number          " Line numbers on
    set showmatch       " Show matching brackets.
    set matchtime=5     " Bracket blinking.
    set novisualbell    " No blinking
    set noerrorbells    " No noise.
    set laststatus=2    " Always show status line.
    set visualbell t_vb= " disable any beeps or flashes on error
        au GuiEnter * set visualbell t_vb=
    set ruler           " Show ruler
    set showcmd         " Display an incomplete command in the lower right
                        " corner of the Vim window
    set shortmess=atI   " Shortens messages
    set nolist          " Display unprintable characters f12 - switches
    set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«
                        " Unprintable chars mapping
    set cursorline      " hightlight current line

    " Folding {
        set foldenable          " Turn on folding
        "set foldmethod=marker   " Fold on the marker
        set foldmethod=syntax
        set foldlevel=20        " Don't autofold anything
                                " (but I can still fold manually)
        set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    " }

    set mouse=a         " Enable mouse
    set mousehide       " Hide mouse after chars typed

    set splitbelow
    set splitright

    " Color scheme for non gvim {
        set t_Co=256
        if !has('gui_running')
            color wombat256mod
            highlight ColorColumn ctermbg=233   " must be set after color scheme
        endif
    " }

" }

" Vundle {
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    Plugin 'Valloric/YouCompleteMe'
    Plugin 'fatih/vim-go'
    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/nerdtree'
    Plugin 'bling/vim-airline'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'tpope/vim-fugitive.git'
    Plugin 'jplaut/vim-arduino-ino'
    "Plugin 'xolox/vim-misc'
    "Plugin 'xolox/vim-session'
    "Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'kien/ctrlp.vim'
    Plugin 'junegunn/goyo.vim'
    Plugin 'airblade/vim-gitgutter'

    " Track the engine.
    "Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    "Plugin 'honza/vim-snippets'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
" }

" Plugins {
    " Airline {
        let g:airline_powerline_fonts=1
        let g:Powerline_symbols='fancy'
    " }

    " NERDTree {
        nmap <F7> :NERDTreeToggle<CR>
    " }

    " Tagbar {
        nmap <F8> :TagbarToggle<CR>
    " }

    " VIM-Go {
        " This trigger takes advantage of the fact that the quickfix window can be
        " easily distinguished by its file-type, qf. The wincmd J command is
        " equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
        " the very bottom (see :help :wincmd and :help ^WJ).
        autocmd FileType qf wincmd J

        " run current file with ctrl+return
        au FileType go nmap <C-CR> <Plug>(go-run)

        let g:go_fmt_command = "goimports"
    " }

    " YCM {
        " Auto close preview window after completion
        let g:ycm_autoclose_preview_window_after_completion=1
    " }

    " Ultisnips {
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        " let g:UltiSnipsExpandTrigger="<c-s>"
        " let g:UltiSnipsJumpForwardTrigger="<c-b>"
        " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " }

" }

" syntax highlighting for arduino projects
"autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
    let mapleader = ","          " set leader key
