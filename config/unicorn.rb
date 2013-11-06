rails_root = "/apps/website_wuhan/current"
rails_env  = "production"
pid_file   = "#{rails_root}/tmp/pids/unicorn.pid"
socket_file= "#{rails_root}/tmp/sockets/unicorn.sock"
log_file   = "#{rails_root}/log/unicorn.log"
err_log    = "#{rails_root}/log/unicorn.error.log"
old_pid    = pid_file + '.oldbin'

timeout 60
worker_processes 4

# Listen on a Unix data socket
listen socket_file, :backlog => 2048
pid pid_file

stderr_path err_log
stdout_path log_file

preload_app true

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{rails_root}/Gemfile"
end

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!

  # Using this method we get 0 downtime deploys.
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection

  child_pid = server.config[:pid].sub('.pid', ".#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")
end
