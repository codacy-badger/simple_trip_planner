FROM ruby:2.6.3

ENV PATH=/root/.yarn/bin:$PATH
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y build-essential nodejs yarn \
      postgresql-client libpq-dev

RUN mkdir /simple_trip_planner
WORKDIR /simple_trip_planner

# Install gems
COPY Gemfile /simple_trip_planner/Gemfile
COPY Gemfile.lock /simple_trip_planner/Gemfile.lock
RUN bundle install

# Install yarn packages
COPY package.json yarn.lock /app/
RUN yarn install

COPY . /simple_trip_planner

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]