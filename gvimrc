" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:



" Solarized Colorscheme Config {
    let g:solarized_contrast="high"     "default value is normal
    let g:solarized_visibility="normal" "default value is normal
    set background=dark
    colorscheme solarized
" }


set gfn=Meslo\ LG\ S\ for\ Powerline\ 9 " Set font for gvim
"set gfn=Menlo\ for\ Powerline\ 9
set guioptions=             " remove everything
"set guioptions+=m           " add main menu
call togglebg#map("<F5>") " toggle solarized bg dark/light
