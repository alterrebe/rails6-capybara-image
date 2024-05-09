FROM ruby:3.0.6-buster

# G++ and QT are needed for the capybara-webkit
RUN apt-get update -qq && \
  apt-get install -y nodejs \
    g++ qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

RUN mkdir -p /deps
WORKDIR /deps

COPY Gemfile ./

RUN bundle install --verbose --retry 5
