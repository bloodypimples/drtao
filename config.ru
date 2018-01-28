# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

if not ENV['PATH']
  puts "PATH is not defined"
  ENV['PATH'] = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
end
