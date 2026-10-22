xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

augroup FormatNotice
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.md,*.py let b:tick_before = b:changedtick
  " autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.md,*.py if b:changedtick != b:tick_before | echom 'Formatted: ' . expand('%:t') | endif
augroup END

