require 'json'

# define data test
class Event
  def get (str)
    return str
  end
  def cancel ()
    return nil
  end
end


event = Event.new
path = ARGV[0]
puts ARGV
@code = "
  eval File.read('#{path}')
"
eval("@codeblock = lambda { |map| #{@code} }", binding, "(aggregate filter code)")
map = {}

# test duplicate data
for i in 1..3
  @codeblock.call(map)
end

puts JSON.pretty_generate(map)



