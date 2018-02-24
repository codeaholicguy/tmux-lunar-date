#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tet_interpolation_count="#($CURRENT_DIR/scripts/tet.sh)"
tet_interpolation_string="\#{online_status}"

source $CURRENT_DIR/scripts/shared.sh

do_interpolation() {
  local string="$1"
  local interpolated="${string/$tet_interpolation_string}/$tet_interpolation_count"
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
