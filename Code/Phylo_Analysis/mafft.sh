#!/bin/bash

ORTHOGROUP_DIR=~/orthofinder_results/Results*/Single_Copy_Orthologue_Sequences
ALIGN_DIR=~/mafft_alignments
mkdir -p "$ALIGN_DIR"

for FILE in "$ORTHOGROUP_DIR"/*.fa; do
    BASENAME=$(basename "$FILE" .fa)
    echo "🔄 Aligning $BASENAME..."

    mafft --auto "$FILE" > "$ALIGN_DIR/${BASENAME}_aligned.fa"
done

echo " MAFFT alignment complete. Alignments in $ALIGN_DIR"
