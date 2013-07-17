file = ARGV[0]

require 'haml'
require 'sass'
require 'coffee-script'

`haml #{file}.haml #{file}.html`
`sass #{file}.sass:#{file}.css`
t = CoffeeScript.compile File.read("#{file}.coffee")
File.open("#{file}.js", "w") do |f|
  f.puts t
end

`open #{file}.html`
