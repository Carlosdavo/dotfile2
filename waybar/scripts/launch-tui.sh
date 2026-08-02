#!/bin/bash

TERMINAL="kitty" # O tu terminal preferido
APP=$1

if pgrep -f "$APP" >/dev/null; then
  # Si ya está corriendo, enfoca la ventana
  hyprctl dispatch focuswindow "$APP"
else
  # Si no, ábrela
  $TERMINAL --class floating -e "$APP"
fi
