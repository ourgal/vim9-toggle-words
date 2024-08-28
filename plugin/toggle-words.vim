if !has('vim9script') ||  v:version < 900
    finish
endif
vim9script

const save_cpo = &cpo
set cpo&vim

import autoload '../lib/ToggleWord.vim' as lib

const toggle_words = lib.ToggleWord.new()

nnoremap <c-a> <scriptcmd>toggle_words.Main('+', v:count1)<cr>
nnoremap <c-x> <scriptcmd>toggle_words.Main('-', v:count1)<cr>

&cpo = save_cpo
