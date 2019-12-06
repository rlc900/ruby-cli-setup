require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# desc 'print hearts 100 times'
# task :hearts_printer do
#   puts '💛' * 100
# end
