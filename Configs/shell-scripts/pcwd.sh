#!/bin/sh

pcwd() {
  # Replace $HOME with ~ in the current path
  short_path=$(echo "$PWD" | sed "s|^$HOME|~|")

  # Count the number of sections (directories) in the path
  section_count=$(echo "$short_path" | tr -cd '/' | wc -c)
  section_count=$((section_count + 1))

  if [ "$section_count" -gt 4 ]; then
    # Get the first two sections
    first_section=$(echo "$short_path" | cut -d'/' -f1,2)

    # Get the last two sections
    last_section=$(echo "$short_path" | rev | cut -d'/' -f1,2 | rev)

    # Combine with ellipsis
    echo "${first_section}/.../${last_section}"
  else
    # If path is short enough, just print it as is
    echo "$short_path"
  fi
}

pcwd
