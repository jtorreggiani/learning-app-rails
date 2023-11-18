# Learning app rails

An app for learning ruby on rails.

## About this repository

The repository houses a ruby-on-rails app designed to help learn about to build and deploy web applications.

## Development

This project is setup to use Docker for development. Assuming you already have Docker desktop installed. You should be able to run the following commands to get up
and running.

```
docker compose build
docker compose up
```

## Deployment

This repository is setup to automatically deploy to Digital Ocean (DO) App platform when code is merged into the main branch. Do handles the heavy lifting for build the application. In the future, we will explore deploying this site to other platforms.

## TODO

- [ ] Add tests to CI
- [ ] Add Ruby linters