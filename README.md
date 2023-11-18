# Learning app rails

An app for learning ruby on rails.

# About this repository

The repository houses a ruby-on-rails app designed to help learn about to build and deploy web applications.

# Using Docker to run the application

Build a Docker image.

```
docker build -t learning-app-rails .
```

Run start the container from the image.

```
docker run -p 3000:3000 learning-app-rails
```

Connect to the running container

```
docker exec -it [CONTAINER_ID] /bin/bash
```
