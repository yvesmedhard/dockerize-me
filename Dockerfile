FROM ruby:2.5

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
  build-essential \
  nodejs \
  yarn \
  libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /web
ADD . /web

ENTRYPOINT ["./bin/docker-entrypoint"]


ENV BUNDLE_PATH=/bundle \
  BUNDLE_BIN=/bundle/bin \
  BUNDLE_JOBS=2 \
  GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
