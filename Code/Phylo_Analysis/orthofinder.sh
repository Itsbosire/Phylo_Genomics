#!/bin/bash

# OrthoFinder input
INPUT_DIR=~/proteomes
OUT_DIR=~/orthofinder_results

mkdir -p "$OUT_DIR"

orthofinder -f "$INPUT_DIR" -o "$OUT_DIR" -t 4

echo " OrthoFinder complete. Results in $OUT_DIR"
