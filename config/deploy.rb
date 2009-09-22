set :application, "del2ip"
set :repository,   "git@github.com:jtoy/del2ip.git"
set :domain, ENV['DEL2IP_DOMAIN']
set :deploy_to, "/usr/local/www/rails/#{application}"