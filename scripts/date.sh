#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/shared.sh

main() {
  DATE="$($CURRENT_DIR/bin/date)"
  printf "$DATE"
}

main
