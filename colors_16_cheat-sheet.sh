#!/bin/bash
# Cheat sheet for using bash 16-color codes
# colors_16-cheat-sheet.sh
# URL:  https://github.com/Boruch-Baum/bash-16-color-cheat-sheet
# ©2018 Boruch Baum <boruch-baum@gmx.com>
# Distributed under GPL3+ license
#
# Commentary:
#
#   How is it that, 5779 years after Creation, there still isn't a
#   widely available useful and intelligible cheat sheet script for
#   bash 16-color codes?!

printf "\n\t\033[4mbash colors in 16-color mode\033[0m\n
 Usage: \\\033[\033[1m codes \033[0mm  --or--  \\\e[\033[1m codes \033[0mm

 Example: Reset colors to default: \\\033[\033[1m0\033[0mm --or-- \\\e[\033[1m0\033[0mm

 Any number of codes may be combined, delimited by semi-
 colons, in any sequence, although more than four don't
 make sense, and the final ones win. In the first four
 black examples below, we cheat by adding a white
 foreground code in  order to guarantee visibility. Also,
 note how reversing a foreground color seems the same as
 using a background one.

 Style codes:  0=reset    2=normal      7=reverse
               1=bold     4=underline   9=strike-through

 Foreground color codes:
               30=black   31=red       32=green   33=yellow
               34=blue    35=magenta   36=cyan    37= white

 Background color codes:
               40=black   41=red       42=green   43=yellow
               44=blue    45=magenta   46=cyan    47= white\n
"
set -- "normal\t" "bold\t" "underline" "strike-through" "reverse"
for STYLE in 2 1 4 9 7; do
  # Start includes example of black fg on white bg
  printf " \033[0m$1\t\033[${STYLE};30;47m${STYLE};30\033[0;30;40m "
  shift
  for FG in $(seq 31 37); do
    printf "\033[${STYLE};${FG};40m${STYLE};${FG}\033[0;30;40m "
  done
printf "\n\n"
done
# Again, start includes example of white fg on black bg
printf " \033[0mbackground\t\033[0;37;40m*;40\033[0;30;40m \033[0m"
for BG in $(seq 41 47); do
  CTRL=""
  echo -en "\033[0;30;${BG}m*;${BG}\033[0m "
done
printf "\n\n Examples combining three and four attributes:
 * red bold and underline:        \033[31;1;4m\\\\033[31;1;4m\033[0m
 * the same on a cyan background: \033[1;46;4;31m\\\\033[1;46;4;31m\033[0m\n\n"

read -N 1 -sp " Press any key for a visibility table of
 foreground / background color combinations or
 press C-c to abort
"

printf "\n\t\033[4mbackground / foreground visibility table\033[0m\n\n"
for BG in $(seq 40 47); do
  for STYLE in 2 1; do
    for FG in $(seq 30 37); do
      printf " \033[${STYLE};${BG};${FG}m${STYLE};${BG};${FG}\033[0m"
    done
    printf "\033[0m\n"
  done
  printf "\n"
done
