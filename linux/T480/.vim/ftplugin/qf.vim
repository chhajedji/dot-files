" sets cursorline for when entering quickfix buffer (used to navigate through
" results with `:copen` when `grep` is used within vim)
" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
   finish
endif

" wincmd p " go to original window
set cursorline
" wincmd p " back to quickfix window
