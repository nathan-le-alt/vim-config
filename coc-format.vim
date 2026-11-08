xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format)

let s:fmt = '*.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.md,*.java,*.py,*.c,*.cpp'

function! FormatNotice() abort
  redraw
  echo 'formatted: ' . expand('%:t')
  call timer_start(2000, {-> execute('echo ""', '')})
endfunction

augroup FormatOnSave
  autocmd!
  execute 'autocmd BufWritePre ' . s:fmt . ' let b:tick_before = b:changedtick'
  autocmd BufWritePre *.py silent! call CocAction('runCommand', 'ruff.executeAutofix')
  execute 'autocmd BufWritePre ' . s:fmt . ' silent! call CocAction("format")'
  execute 'autocmd BufWritePost ' . s:fmt . ' if b:changedtick != get(b:, "tick_before", b:changedtick) | call FormatNotice() | endif'
augroup END
