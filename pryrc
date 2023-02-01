require 'awesome_print'
AwesomePrint.pry!

Pry.config.history_file = '~/.pry_history'

Pry.config.color          = true
Pry.config.auto_indent    = true
Pry.config.correct_indent = true

Pry.config.prompt = [
  proc { 'input> ' },
  proc { '     | ' }
]
