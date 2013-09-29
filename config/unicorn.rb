
worker_processes 2
working_directory "/var/www/testapp/"

preload_app true

timeout 30

listen "/var/www/testapp/tmp/sockets/unicorn.sock", :backlog => 64
listen 8080

pid "/var/www/testapp/tmp/pids/unicorn.pid"

stderr_path "/var/www/testapp/log/unicorn.stderr.log"
stdout_path "/var/www/testapp/log/unicorn.stdout.log"

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
