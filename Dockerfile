FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs \
  postgresql-client libpq-dev

RUN mkdir /simple_travel_planner
WORKDIR /simple_travel_planner
COPY Gemfile /simple_travel_planner/Gemfile
COPY Gemfile.lock /simple_travel_planner/Gemfile.lock
RUN bundle install
COPY . /simple_travel_planner

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]