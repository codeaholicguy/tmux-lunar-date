#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/shared.sh

main() {
  COUNTER="$($CURRENT_DIR/bin/tet)"
  printf "$COUNTER days to Tet"
}

main
