#!/bin/bash

ALIGN_DIR=~/mafft_alignments
TREE_DIR=~/iqtree_results
mkdir -p "$TREE_DIR"

for FILE in "$ALIGN_DIR"/*_aligned.fa; do
    BASENAME=$(basename "$FILE" _aligned.fa)
    echo " Running IQ-TREE with bootstrapping on $BASENAME..."

    iqtree2 -s "$FILE" \
        -m TEST \
        -bb 1000 \
        -nt AUTO \
        -pre "$TREE_DIR/${BASENAME}"

    echo " IQ-TREE finished for $BASENAME"
done

echo " All trees with bootstrap support saved in $TREE_DIR"
