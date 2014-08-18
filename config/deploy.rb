require 'bundler/capistrano'

module UseScpForDeployment
  def self.included(base)
    base.send(:alias_method, :old_upload, :upload)
    base.send(:alias_method, :upload, :new_upload)
  end

  def new_upload(from, to, options = {}, &block)
    old_upload(from, to, options.merge(:via => :scp), &block)
  end
end

Capistrano::Configuration.send(:include, UseScpForDeployment)

server "neptun.cyclonelabs.com", :web, :app, :db, primary: true
ssh_options[:port] = 13527

set :user, "justvitalius"
set :application, "ziklon"
set :deploy_to, "/srv/web/#{application}"
set :use_sudo, false
set :scm, :none
set :repository, "."
set :deploy_via, :copy
set :local_repository, "."
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace(:thin) do
  task :stop do
    run %Q{cd #{latest_release} && sudo bundle exec thin stop -C /etc/thin/ziklon.yml}
   end
  
  task :start do
    run %Q{cd #{latest_release} && sudo bundle exec thin start -C /etc/thin/ziklon.yml}
  end

  task :restart do
    run %Q{cd #{latest_release} && sudo bundle exec thin restart -C /etc/thin/ziklon.yml}
  end
end



# after "deploy", "deploy:cleanup"