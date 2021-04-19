require 'mina/rails'
require 'mina/git'
set :application_name, 'meal_plan'
set :domain, '3.21.231.111'
set :deploy_to, '/home/ubuntu/projects/meal_plan'
set :repository, 'git@github.com:Akash-DRO/meal_plan.git'
set :branch, 'master'
set :user, 'ubuntu'          # Username in the server to SSH to.
set :forward_agent, true     # SSH forward_agent.
desc "Deploys the current version to the server."
task :deploy do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    command 'docker-compose -p mp build'
    command 'docker-compose -p mp down'
    command 'docker-compose -p mp up -d'
    invoke :'deploy:cleanup'
  end
end
