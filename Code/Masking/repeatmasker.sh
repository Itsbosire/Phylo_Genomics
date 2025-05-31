#!/bin/bash

# Directory containing your genome .fna files
GENOME_DIR=~Desktop/Maniacs/Phylo_genomics/Quality_Control/Genome_scaffolding/scaffolding_results # Use the scaffolded genomes for downstream analysis

OUTPUT_DIR=~/Desktop/Maniacs/Phylo_genomics/Masked_genomes
# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each genome
for GENOME in "$GENOME_DIR"/*.fna; do
    BASENAME=$(basename "$GENOME" .fna)
    
    echo "Running RepeatMasker on $BASENAME..."

    RepeatMasker \
        -xsmall \                          # Soft-masking (lowercase)
        -species "Puccinia graminis" \                   # Specify repeat library
        -dir "$OUTPUT_DIR/$BASENAME" \     # Output folder for each genome
        "$GENOME"
done

echo "RepeatMasker soft-masking completed for all genomes."
