#!/bin/bash

main () {
  local name=$1
  [[ -z "$name" ]] && echo "config name not provided." && return 1;
  [[ -d "$name" ]] && echo "config already exists." && return 1;
  mkdir -p "$name/.config/$name"
  stow "$name"
  echo "config created for $name"
}
main "$@"
