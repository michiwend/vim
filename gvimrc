" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

autocmd! bufwritepost .gvimrc source %  " Automatic reloading of .gvimrc

" Solarized Colorscheme Config {
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"     "default value is normal
    let g:solarized_visibility="normal" "default value is normal
    set background=dark
    colorscheme solarized
" }

" CUSTOM FOLD HEADERS {
    " This is a hack to hide all '-' of all fold headers by renaming foldtext
    " to <custom text>+<fill with whitspaces> thx to
    " http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
    fu! CustomFoldText()
        "get first non-blank line
        let fs = v:foldstart
        while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
        endwhile
        if fs > v:foldend
            let line = getline(v:foldstart)
        else
            let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
        endif

        let w = winwidth(0) - &foldcolumn - (&number ? 4 : 0)
        let foldSize = 1 + v:foldend - v:foldstart
        let foldSizeStr = " " . foldSize . " lines "
        let foldLevelStr = repeat("       ", v:foldlevel)
        let lineCount = line("$")
        let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
        let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
        return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
    endf
    
    set foldtext=CustomFoldText()
" }

set gfn=Meslo\ LG\ S\ for\ Powerline\ 18 " Set font for gvim
set guioptions=   " remove everything
