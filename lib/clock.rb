require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(5.seconds, 'create record') do
    numb = rand(50)
    name = %w(ruby css js html).sample
    Language.create(name: name, number: numb)
  end
end
