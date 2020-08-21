FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /2ndapp
WORKDIR /2ndapp
COPY Gemfile /2ndapp/Gemfile
COPY Gemfile.lock /2ndapp/Gemfile.lock
RUN bundle install
COPY . /2ndapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]