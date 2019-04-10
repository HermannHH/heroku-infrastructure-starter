#!/bin/bash

read -p "Enter the target app name: "  targetApp
echo "Target App set to: $targetApp"

# Set Master Key on Rails 5 App
read -p "Enter the rails master key: "  masterKey
heroku config:set RAILS_MASTER_KEY=$masterKey -a $targetApp

# Install Addons
heroku addons:create papertrail:choklad -a $targetApp
heroku addons:create redistogo:nano -a $targetApp
heroku addons:create sendgrid:starter -a $targetApp
heroku addons:create heroku-postgresql:hobby-dev -a $targetApp
heroku addons:create sentry:f1 -a $targetApp
heroku pg:backups:schedule DATABASE_URL --at '00:00 UTC' -a $targetApp
