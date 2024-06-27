FROM ruby:3.0.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Rails app lives here
WORKDIR /app

# Install application gems
COPY Gemfile Gemfile.lock ./

RUN bundle install

RUN rails db:migrate

# Copy application code
COPY . .

# Start the server by default, this can be overwritten at runtime
EXPOSE 3005
CMD ["rails", "server", "-b", "0.0.0.0"]
