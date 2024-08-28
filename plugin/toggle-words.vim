if !has('vim9script') ||  v:version < 900
    finish
endif
vim9script

const save_cpo = &cpo
set cpo&vim

import autoload '../lib/ToggleWord.vim' as lib

const toggle_words = lib.ToggleWord.new()

nnoremap <Plug>Vim9TogglePlus <scriptcmd>toggle_words.Main('+', v:count1)<cr>
nnoremap <Plug>Vim9ToggleMinus <scriptcmd>toggle_words.Main('+', v:count1)<cr>

nnoremap <c-a> <Plug>Vim9TogglePlus
nnoremap <c-x> <Plug>Vim9ToggleMinus

&cpo = save_cpo
