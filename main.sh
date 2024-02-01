#!/bin/bash

#clean up all dangling resources
clean_all() {
  echo "Clean all"
  docker system prune -a --volumes
}

clean_images() {
  echo "Clean images"
  docker rmi $(docker images -q) -f

}

clean_containers() {
  echo "Clean containers"
  docker container stop $(docker container ls -aq)
  docker container rm $(docker container ls -aq) -f
}

clean_volumes() {
  echo "Clean volumes"
  docker volume prune -a -f
}

_run() {
  clean_all
  clean_images
  clean_containers
  clean_volumes

  echo "Clean docker finished"
}

_run