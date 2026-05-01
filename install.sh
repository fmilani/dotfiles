#!/bin/bash

main() {
  pushd "$(dirname $0)" > /dev/null
  dirs=$(find . -mindepth 1 -maxdepth 1 -depth -type d -not -path '*/\.*' -printf '%f\n')
  for dir in $dirs
  do
    stow -D "$dir"
    stow "$dir"
  done
  popd > /dev/null
}

main
