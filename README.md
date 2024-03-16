# X Clone

## macOS Setup
* `brew install postgresql`
* `brew services start postgresql`
* `rails new x-clone -T -d postgresql --css=bootstrap`
* `./bin/dev`

## Authentication + Authorization: devise
* `gen "devise"`
* `bundle install`
* `bundle exec rails generate devise:install`
* `bundle exec rails g devise user`
* `bundle exec rails db:migrate db:test:prepare`
* `bundle exec rails g devise:views`