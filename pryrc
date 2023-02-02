require 'awesome_print'
AwesomePrint.pry!

Pry.config.history_file = '~/.pry_history'

Pry.config.color          = true
Pry.config.auto_indent    = true
Pry.config.correct_indent = true

Pry::Prompt.add(
  :custom,
  'My custom prompt', ['>', '|']
) do |_context, _nesting, pry_instance, sep|
  sep == '>' ? 'input> ' : '     | '
end

Pry.config.prompt = Pry::Prompt[:custom]
