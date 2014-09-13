root = "/home/z-fend"
worker_processes 2
working_directory root

preload_app true

timeout 30

listen "#{root}/tmp/sockets/unicorn.sock", :backlog => 64
listen 8080

pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.stderr.log"
stdout_path "#{root}/log/unicorn.stdout.log"

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end
