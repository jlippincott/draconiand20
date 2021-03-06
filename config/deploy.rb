# This file sets a project up on Devsol
# ------------------------------------

# The project name - referenced for repo & database name
set :application, "draconiand20"

# The github context (default metaltoad)
set :githubcontext, "jlippincott"

# List the Drupal multi-site folders.  Use "default" if no multi-sites are installed.
# set :domains, ["example.metaltoad.com", "example2.metaltoad.com"]
set :domains, ["default"]

# Set the repository type and location to deploy from.
set :scm, :git
set :repository,  "git@github.com:#{githubcontext}/#{application}.git"

# NOTE: older projects used svn.  This is here for posterity.
# set :scm, :subversion
# set :repository,  "https://svn.metaltoad.com/svn/#{application}/trunk/"
# set(:scm_password) { Capistrano::CLI.password_prompt("SCM Password: ") }

# Set the database passwords that we'll use for maintenance. Probably only used during setup. 
set(:db_root_pass) { Capistrano::CLI.password_prompt("Production Root MySQL password: ") }
set(:db_pass) { random_password }

# The subdirectory within the repo containing the DocumentRoot.
set :app_root, "drupal"

# Use a remote cache to speed things up
set :deploy_via, :remote_cache

# Multistage support - see config/deploy/[STAGE].rb for specific configs
set :default_stage, "dev"
set :stages, %w(dev staging prod)

# Generally don't need sudo for this deploy setup
set :use_sudo, false

# This allows the sudo command to work if you do need it
default_run_options[:pty] = true

# Override these in your stage files if you need to use something other than apache:mtm
set :chown_user, 'apache'
set :chown_group, 'mtm'
