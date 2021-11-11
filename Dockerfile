FROM ruby:2.6.5
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs
RUN mkdir /my2ndapp
WORKDIR /my2ndapp
COPY Gemfile /my2ndapp/Gemfile
COPY Gemfile.lock /my2ndapp/Gemfile.lock
RUN bundle install
COPY . /my2ndapp

RUN SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile \
&& yarn cache clean \
&& rm -rf node_modules tmp/cache

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD [ "sh", "/start.sh" ]