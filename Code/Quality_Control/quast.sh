#!/bin/bash

# Set input and output directories
GENOME_DIR=~Desktop/Maniacs/Phylo_genomics/Data/
OUTPUT_DIR=~/Desktop/Maniacs/Phylo_genomics/Quality_Control/Quast_results

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each .fna file
for FILE in "$GENOME_DIR"/*.fna; do
    BASENAME=$(basename "$FILE" .fna)
    OUTDIR="${OUTPUT_DIR}/${BASENAME}_quast"

    echo "Running QUAST for $BASENAME..."

    quast "$FILE" \
        -o "$OUTDIR" \
        --threads 4 \
        --labels "$BASENAME"

done

echo "QUAST analysis completed for all genomes."
