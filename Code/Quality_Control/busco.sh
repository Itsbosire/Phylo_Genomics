#!/bin/bash

# Set paths
GENOME_DIR=~/Desktop/Maniacs/Phylo_genomics/Data # Adjust this according to the path on your machine
OUTPUT_DIR=~/Desktop/Maniacs/Phylo_genomics/Quality_Control/busco_results # Directory to save BUSCO output
LINEAGE=fungi_odb10  # BUSCO lineage dataset for fungi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all .fna files in the genome directory
for FILE in "$GENOME_DIR"/*.fna; do
    BASENAME=$(basename "$FILE" .fna)
    echo "Running BUSCO on $BASENAME..."

    busco -i "$FILE" \
          -l "$LINEAGE" \
          -o "${BASENAME}_busco" \
          -m genome \
          --out_path "$OUTPUT_DIR"
done

echo "BUSCO analysis completed for all .fna genomes."
