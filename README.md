# FREEMED DOCKER CONTAINER

This is a "trusted build" for [Docker](http://docker.io/). It allows
[FreeMED](https://github.com/freemed/freemed) to be run with a single
Docker command.

## Running/Installing from the Docker Repository

*The repository page is located at
[https://index.docker.io/u/jbuchbinder/freemed/](https://index.docker.io/u/jbuchbinder/freemed/).*

```
docker pull jbuchbinder/freemed
```

## Running/Installing from Github

This will run **FreeMED** on `localhost:8080`.

```
docker build -rm -t freemed git://github.com/freemed/freemed-docker.git
docker run -p 8080:80 -d freemed
```

To get a shell (for debugging):

```
docker run -i -t -p 8080:80 freemed /bin/bash
```

