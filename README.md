# Papercups

The code behind [app.papercups.io](https://app.papercups.io/)

![dashboard-v1](https://user-images.githubusercontent.com/5264279/88119050-4f54b480-cb8d-11ea-8f50-1a656068fd82.gif)

## One click Heroku deployment

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/papercups-io/papercups)


## Develop on Okteto 

[![Develop on Okteto](https://img.shields.io/endpoint?url=https%3A%2F%2Fokteto.com%2Fbadge.json)](https://cloud.okteto.com/deploy)

## Getting started

To start your server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start the server with `mix phx.server`

This will automatically start up the React frontend in watch mode on `localhost:3000`, with the API running on `localhost:4000`.

### To start client side

The frontend code will start up automatically when you run `mix phx.server`, but for more information see: [assets/README.md](assets/README.md)

## Setting up email alerts

Set the environment variables in the [`.env.example`](https://github.com/papercups-io/papercups/blob/master/.env.example) file.

At the moment we only support [Mailgun](https://www.mailgun.com/) — other messaging channels are coming soon!

## Running tests

Create a PostgreSQL test database named: `chat_api_test`, and run:

```
mix test
```

## Deploying

We currently use Heroku for deployments:

```
git push heroku master
```

## Running compiler on file change

_Note_: Make sure you are running this inside of ChatApi otherwise it'll trigger on UI changes

```
./scripts/compile_watch.sh
```

## Learn more about Phoenix

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
