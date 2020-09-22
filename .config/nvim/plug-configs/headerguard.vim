function! g:HeaderguardName()
  return "_" . toupper(expand('%:t:rs/[^0-9a-zA-Z_]/_/g')) . "_"
endfunction

function! g:HeaderguardLine3()
  return "#endif"
endfunction
