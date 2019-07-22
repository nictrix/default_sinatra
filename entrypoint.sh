#!/usr/bin/env sh                                                                                                              
set -e

# Remove a potentially pre-existing server.pid
rm -f /opt/default_sinatra/tmp/pids/server.pid

# Do migrations
bundle exec rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
