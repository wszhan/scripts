#!/bin/bash

declare -r BASH_SESSION_NAME="bash"
declare -r BUILD_SESSION_NAME="build"

create_cmake_tutorial_session() {
  create_generic_session "$1"
  # other custom operations
}

create_generic_session() {
  # Use -d to allow the rest of the function to run
  tmux new-session -d -s $1
  # -n for new window
  # -d to prevent current window from changing
  #tmux new-window -d -n ${BASH_SESSION_NAME}
  #tmux new-window -d -n ${BUILD_SESSION_NAME}
  # -d to detach any other client (in case there's any)
  tmux attach-session -d -t $1
}

#create_tmux_session $@
if [ $1 == "cmake" ]; then
  create_cmake_tutorial_session $1
else
  create_generic_session $1
fi
