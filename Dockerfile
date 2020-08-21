FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /my2ndapp
WORKDIR /my2ndapp
COPY Gemfile /my2ndapp/Gemfile
COPY Gemfile.lock /my2ndapp/Gemfile.lock
RUN bundle install
COPY . /my2ndapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]