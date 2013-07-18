file = ARGV[0]

require 'haml'
require 'sass'
require 'coffee-script'

if File.exists? "#{file}.haml"
  `haml #{file}.haml #{file}.html`
end

if File.exists? "#{file}.sass"
  `sass #{file}.sass:#{file}.css`
end

if File.exists? "#{file}.coffee"
  t = CoffeeScript.compile File.read("#{file}.coffee")
  File.open("#{file}.js", "w") do |f|
    f.puts t
  end
end

`open #{file}.html`
