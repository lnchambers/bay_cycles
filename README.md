# README

* Ruby version

2.4.1

* System dependencies

Rails. See [here](https://github.com/lnchambers/bay_cycles/network/dependencies) for all dependencies

* Configuration

Fork or clone this repo (`git clone https://github.com/lnchambers/bay_cycles.git`)

Run `bundle install` to install dependencies

* Database creation and initialization

Run `rails db:create db:migrate db:seed` or `rails db:setup`

* Server

Run `rails s` to start the server in development mode.

Take your favorite browser on a trip to `localhost:3000` and play around.

Alternatively, to run the server in production mode:

  Run `RAILS_ENV=production rails s -p 4000 -P ./tmp/pids/alternate_server.pid`

  Take your favorite browser to `localhost:4000`. This allows you to simultaneously run both development and production servers.

* How to run the test suite

Run `rspec` from your command line.

To target a specific test or folder of tests, specify the path after `rspec`

e.g. `rspec spec/features/users`
