set :application, "ccnz-map-generator"
set :repository, "http://github.com/malclocke/ccnz-map-generator.git"
set :scm, :git
set :user, 'otm'

role :app, "maps.eq.org.nz"
role :web, "maps.eq.org.nz"
role :db,  "maps.eq.org.nz", :primary => true
set :deploy_to, "/home/otm/rails/ccnz-map-generator"

default_environment["PATH"] = "/home/otm/.gem/ruby/1.8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

# It should be safe to leave the settings below untouched
#set :deploy_via, :remote_cache

#ssh_options[:forward_agent] = true
set :use_sudo, false

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

require 'bundler/capistrano'
