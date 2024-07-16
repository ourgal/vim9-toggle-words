vim9script

import autoload '../lib/std.vim'

export class ToggleWord
  var line: std.Line
  var cursor_old: std.Cursor
  var cursor_new: std.Cursor
  const toggle_words: list<list<string>>

  def new()
    this.toggle_words = [['true', 'false'], ['True', 'False']] + get(g:, 'toggle_words', [])
  enddef

  def _Toggle(group: list<string>): bool
    const [found, _] = this.line.Jump(this.cursor_new, group)
    if found
      const current_word = expand('<cword>')
      const next_word = group[( group->index(current_word) + 1) % len(group)]
      const new_line = this.line.PrevCursorStr(this.cursor_new, false) .. this.line.AfterCursorStr(this.cursor_new)->substitute($'\<{current_word}\>', next_word, '')
      new_line->setline('.')
      return true
    else
      return false
    endif
  enddef

  def Refresh()
    this.line = std.Line.new()
    this.cursor_old = std.Cursor.new()
    this.line.Backword(this.cursor_old)
    this.cursor_new = std.Cursor.new()
  enddef

  def Main(type: string)
    this.Refresh()
    if this._ToggleWords()
      return
    elseif type == '+'
      this.cursor_old.SetCursor()
      normal! 
    elseif type == '-'
      this.cursor_old.SetCursor()
      normal! 
    else
      throw 'ToggleWord fallback type error'
    endif
  enddef

  def _ToggleWords(): bool
    for group in this.toggle_words
      if this._Toggle(group)
        return true
      endif
    endfor

    return false
  enddef

endclass
