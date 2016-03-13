"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>gb :.Gblame<cr>

" Blame on all selected lines in visual mode
vmap <silent> <leader>gb :Gblame<cr>

" Git status
nmap <silent> <leader>gst :Gstatus<cr>

" Like git add
nmap <silent> <leader>gw :Gwrite<cr>

" Git diff
nmap <silent> <leader>gd :Gdiff<cr>

" Git commit
nmap <silent> <leader>gc :Gcommit<cr>

" Git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>

" Git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>

" Git log
nmap <silent> <leader>glog :Git lg<cr>
