" only load filetypes once
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

" when BufRead or BufNewFile event is triggered, pop off the .svn-base extension and
" manually restart filetype autocommands
autocmd! BufRead    *.svn-base execute 'doautocmd filetypedetect BufRead ' . expand('%:r')
autocmd! BufNewFile *.svn-base execute 'doautocmd filetypedetect BufNewFile ' . expand('%:r')

autocmd! BufRead    *.r* execute 'doautocmd filetypedetect BufRead ' . expand('%:r')
autocmd! BufNewFile *.r* execute 'doautocmd filetypedetect BufNewFile ' . expand('%:r')

autocmd BufNewFile,BufRead *.conf	set syntax=json

augroup END
