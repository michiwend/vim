" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

autocmd! bufwritepost .gvimrc source %  " Automatic reloading of .gvimrc

" Solarized Colorscheme Config {
    let g:solarized_contrast="high"     "default value is normal
    let g:solarized_visibility="normal" "default value is normal
    set background=dark
    colorscheme solarized
" }

" Goyo and LimeLight settings {
    nmap <F11> :Goyo<CR>

    let g:goyo_width=100

    let g:limelight_default_coefficient = 0.7

    function! s:goyo_enter()
        set noshowmode
        set noshowcmd
        set nofoldenable
        set scrolloff=999
        Limelight
        " ...
    endfunction

    function! s:goyo_leave()
        set showmode
        set showcmd
        set scrolloff=10
        Limelight!
        " ...
    endfunction

    autocmd! User GoyoEnter
    autocmd! User GoyoLeave
    autocmd  User GoyoEnter nested call <SID>goyo_enter()
    autocmd  User GoyoLeave nested call <SID>goyo_leave()
" }


set gfn=Meslo\ LG\ S\ for\ Powerline\ 9 " Set font for gvim
"set gfn=Menlo\ for\ Powerline\ 9
set guioptions=             " remove everything
"set guioptions+=m           " add main menu
call togglebg#map("<F5>") " toggle solarized bg dark/light
