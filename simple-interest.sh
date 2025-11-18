#!/bin/bash
# simple-interest.sh
# Calculates Simple Interest (SI) using: SI = (P * R * T) / 100
# Usage:
#   1) Interactive: ./simple-interest.sh
#   2) Non-interactive: ./simple-interest.sh <Principal> <Rate> <Time>

set -euo pipefail

calc_si() {
  local P="$1"; local R="$2"; local T="$3"
  # Validate numeric input (integers or decimals)
  if ! [[ $P =~ ^[0-9]+([.][0-9]+)?$ && $R =~ ^[0-9]+([.][0-9]+)?$ && $T =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: P, R, and T must be numeric." >&2
    exit 1
  fi
  # Use bc for floating point arithmetic
  echo "scale=2; ($P * $R * $T) / 100" | bc
}

if [[ $# -eq 3 ]];
then
  SI=$(calc_si "$1" "$2" "$3")
else
  read -rp "Enter Principal: " P
  read -rp "Enter Rate of Interest: " R
  read -rp "Enter Time (in years): " T
  SI=$(calc_si "$P" "$R" "$T")
fi

echo "Simple Interest = ${SI}"
