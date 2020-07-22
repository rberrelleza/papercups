FROM elixir:1.10 as dev
WORKDIR /usr/src/app
ENV MIX_ENV=dev \
    TEST=1 \
    LANG=C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs fswatch && \
    mix local.hex --force && \
    mix local.rebar --force

ENV DATABASE_URL="ecto://postgres:postgres@localhost/chat_api_dev"
ENV PORT=8080

COPY mix.exs mix.lock /usr/src/app/
RUN mix deps.get
COPY assets/package.json assets/package-lock.json /usr/src/app/assets/
RUN npm install --prefix=assets
COPY . . 
RUN npm run build --prefix=assets
RUN mix deps.compile && mix phx.digest && mix release

CMD mix phx.server 

#FROM debian:stretch AS app
#WORKDIR /app
#COPY --from=dev /usr/src/app/_build .
#CMD ["/app/prod/rel/chat_api/bin/chat_api", "start"]