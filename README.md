# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# For swaggerizing the specs
* rake rswag:specs:swaggerize

# For starting the application both frontend react and backend rails and redis using foreman on specified ports 3002 and 3003
* rake start

# For installing packages
* bundle install

# For running sidekiq
* bundle exec sidekiq (make sure the redis is running in parallel)