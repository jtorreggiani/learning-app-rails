# Learning Rails

This repository an web application built with [Ruby on Rails](https://rubyonrails.org/) designed to help learn about the framework and best practices for web development.

## Technology Stack

- [Git](https://git-scm.com/) for version control and collaboration
- [Docker](https://www.docker.com/) for the development environment
- [Ruby 3.2.0](https://www.ruby-lang.org/en/) for the core programming language
- [Ruby on Rails](https://rubyonrails.org/) for the full stack development framework
- [PostgreSQL](https://www.postgresql.org/) for the database
- [TailwindCSS](https://tailwindcss.com/) for the CSS framework
- [Digital Ocean App Platform](https://www.digitalocean.com/products/app-platform) for deploying to production

## Development Environment

This project is setup to use Docker for local development. Assuming you already have [Docker desktop](https://www.docker.com/products/docker-desktop/) installed you should be able to run the following commands to get up
and running.

```
docker compose build
docker compose up
```

Run the web service container to pull up a shell.

```
docker compose run web bash
```

Run rails commands from the console.

```
bin/rails g controller ExampleController index
```

**Developing on your host machine**

If you would like to run the application without Docker you will need Ruby version 3.2.0 running locally and setup a Postgres Database and update the `database.yml` file with the corresponding values.

# Directory Structure

This application follows all of the folder organization conventions for a Rails application.

```
├── app
├── bin
├── config
├── data
├── db
├── docs
├── lib
├── log
├── public
├── storage
├── test
├── tmp
├── vendor
├── config.ru
├── Dockerfile
├── docker-compose.yml
├── Gemfile
├── Gemfile.lock
├── Procfile.dev
├── README.md
└── Rakefile
```

## Environment Variables

Each environment needs multiple variables to be set to be able to run correctly.

```
ACCESS_KEY_ID=
SECRET_ACCESS_KEY=
SECRET_KEY_BASE=
DATABASE_URL=
REDIS_URL=
```

## Deployment

This repository is setup to automatically deploy to Digital Ocean (DO) App platform when code is merged into the main branch. Do handles the heavy lifting for build the application. In the future, we will explore deploying this site to other platforms.

# Media Storage

Media uploaded to the app is stored in Digital Ocean Spaces using ActiveStorage.

## TODO

- [X] Deploy application to Digital Ocean
- [X] Deploy to Heroku
- [X] Add tests to CI
- [X] Add Ruby linters
- [ ] Add Ruby automated documentation
- [ ] Add cucumber for feature testing
- [ ] Add Sentry for monitoring
