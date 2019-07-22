FROM ruby:2.6-alpine

RUN apk add --no-cache --update build-base \
                                ca-certificates \
                                linux-headers \
                                git \
                                postgresql-dev \
                                nodejs \
                                tzdata
RUN gem install bundler

ARG APP_ENV=""
ENV APP_ENV=$APP_ENV

ENV APP_PATH /opt/default_sinatra
WORKDIR $APP_PATH

ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
ADD .ruby-version $APP_PATH
ADD app_installer.sh /usr/bin/
RUN /usr/bin/app_installer.sh

COPY . $APP_PATH

RUN mv $APP_PATH/entrypoint.sh /usr/bin; chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-P", "tmp/pids/server.pid"]
