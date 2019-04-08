FROM ruby:2.5
RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
  build-essential \
  nodejs \
  libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


WORKDIR /web
ADD . /web


ENV BUNDLE_PATH=/bundle \
  BUNDLE_BIN=/bundle/bin \
  BUNDLE_JOBS=2 \
  GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
