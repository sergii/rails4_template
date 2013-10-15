rails_env = ENV['RACK_ENV'] || 'production'
puts "Unicorn env: #{rails_env}"

if rails_env=='production'
    worker_processes 3
    APP_PATH = ENV['APP_PATH'] || '/home/www/app/'
    working_directory APP_PATH + "current"

    listen APP_PATH + "shared/pids/unicorn.sock"
    pid APP_PATH + "shared/pids/unicorn.pid"
    stderr_path APP_PATH + "shared/log/unicorn.stderr.log"
    stdout_path APP_PATH + "shared/log/unicorn.stdout.log"
elsif rails_env=='stage'
    worker_processes 3
    APP_PATH = ENV['APP_PATH'] || '/home/www/app/'
    working_directory APP_PATH + "current"

    listen APP_PATH + "shared/pids/unicorn.sock"
    pid APP_PATH + "shared/pids/unicorn.pid"
    stderr_path APP_PATH + "shared/log/unicorn.stderr.log"
    stdout_path APP_PATH + "shared/log/unicorn.stdout.log"
else
    worker_processes 3
    APP_PATH = ENV['APP_PATH'] || '/home/www/app/'
    working_directory APP_PATH + "current"

    listen APP_PATH + "shared/pids/unicorn.sock"
    pid APP_PATH + "shared/pids/unicorn.pid"
    stderr_path APP_PATH + "shared/log/unicorn.stderr.log"
    stdout_path APP_PATH + "shared/log/unicorn.stdout.log"
end

# Helps ensure the correct unicorn binary is used when upgrading with USR2
# # See http://unicorn.bogomips.org/Sandbox.html
Unicorn::HttpServer::START_CTX[0] = "#{APP_PATH}current/bin/unicorn"

timeout 60
preload_app true

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

# Rails breaks unicorn's logger formatting, reset it
# # http://rubyforge.org/pipermail/mongrel-unicorn/2010-October/000732.html
Unicorn::Configurator::DEFAULTS[:logger].formatter = Logger::Formatter.new

# Forcibly clean environment variables between bundlings
# http://www.mail-archive.com/mongrel-unicorn@rubyforge.org/msg00276.html
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.realpath(__FILE__+"/../../Gemfile")
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection

  child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")
end
