#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

date="#($CURRENT_DIR/scripts/date.sh)"
date_interpolation_string="\#{lunar_date}"

source $CURRENT_DIR/scripts/shared.sh

do_interpolation() {
  local string="$1"
  local interpolated="${string/$date_interpolation_string/$date}"
  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
