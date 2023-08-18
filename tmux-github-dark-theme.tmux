#!/bin/bash
github_dark_black="#22272e"
github_dark_blue="#539bf5"
github_dark_yellow="#c69026"
github_dark_red="#f47067"
github_dark_white="#909dab"
github_dark_green="#57ab5a"
github_dark_visual_grey="#2c3e56"
github_dark_comment_grey="#636e7b"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$github_dark_white"
set "message-bg" "$github_dark_black"

set "message-command-fg" "$github_dark_white"
set "message-command-bg" "$github_dark_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$github_dark_black"
setw "window-status-bg" "$github_dark_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$github_dark_black"
setw "window-status-activity-fg" "$github_dark_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$github_dark_comment_grey"
set "window-active-style" "fg=$github_dark_white"

set "pane-border-fg" "$github_dark_white"
set "pane-border-bg" "$github_dark_black"
set "pane-active-border-fg" "$github_dark_blue"
set "pane-active-border-bg" "$github_dark_black"

set "display-panes-active-colour" "$github_dark_yellow"
set "display-panes-colour" "$github_dark_blue"

set "status-bg" "$github_dark_black"
set "status-fg" "$github_dark_white"

set "@prefix_highlight_fg" "$github_dark_black"
set "@prefix_highlight_bg" "$github_dark_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$github_dark_black,bg=$github_dark_blue"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@github_dark_widgets")
time_format=$(get "@github_dark_time_format" "%R")
date_format=$(get "@github_dark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$github_dark_white,bg=$github_dark_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$github_dark_visual_grey,bg=$github_dark_black]#[fg=$github_dark_visual_grey,bg=$github_dark_visual_grey]#[fg=$github_dark_white, bg=$github_dark_visual_grey]${status_widgets} #[fg=$github_dark_blue,bg=$github_dark_visual_grey,nobold,nounderscore,noitalics]#[fg=$github_dark_black,bg=$github_dark_blue,bold] #h #[fg=$github_dark_yellow, bg=$github_dark_blue]#[fg=$github_dark_red,bg=$github_dark_yellow]"
set "status-left" "#[fg=$github_dark_black,bg=$github_dark_blue,bold] #S #{prefix_highlight}#[fg=$github_dark_blue,bg=$github_dark_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$github_dark_black,bg=$github_dark_black,nobold,nounderscore,noitalics]#[fg=$github_dark_white,bg=$github_dark_black] #I  #W #[fg=$github_dark_black,bg=$github_dark_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$github_dark_black,bg=$github_dark_visual_grey,nobold,nounderscore,noitalics]#[fg=$github_dark_white,bg=$github_dark_visual_grey,nobold] #I  #W #[fg=$github_dark_visual_grey,bg=$github_dark_black,nobold,nounderscore,noitalics]"