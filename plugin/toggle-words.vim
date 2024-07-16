vim9script

import autoload '../lib/ToggleWord.vim' as lib

const toggle_words = lib.ToggleWord.new()

nnoremap <c-a> <scriptcmd>toggle_words.Main('+')<cr>
nnoremap <c-x> <scriptcmd>toggle_words.Main('-')<cr>

# strsotmestrsts false true 20 39
