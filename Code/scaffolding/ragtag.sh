#!/bin/bash

# Define absolute paths
REFERENCE="/home/bosire/Desktop/Maniacs/Phylo_genomics/Genome_scaffolding/Ref_genome/GCF/GCF_genomic.fna"
GENOME_DIR="/home/bosire/Desktop/Maniacs/Phylo_genomics/Genome_scaffolding/Genomes"
OUTPUT_DIR="/home/bosire/Desktop/Maniacs/Phylo_genomics/Genome_scaffolding/scaffolding_results"

mkdir -p "$OUTPUT_DIR"  # Ensure output directory exists

# Find all .fna files in subdirectories and process each one
find "$GENOME_DIR" -type f -name "*.fna" | while read GENOME; do
    BASENAME=$(basename "$GENOME" .fna)
    echo "Scaffolding $BASENAME..."

    # Run RagTag scaffolding with the '-u' flag for unique AGP IDs
    ragtag.py scaffold -u "$REFERENCE" "$GENOME" -o "$OUTPUT_DIR/$BASENAME"

    # Check if scaffolding was successful
    if [ $? -eq 0 ]; then
        echo "Successfully scaffolded $BASENAME."
    else
        echo "Error in scaffolding $BASENAME. Check logs."
        exit 1  # Stop script if an error occurs
    fi

    echo "Finished processing $BASENAME. Moving to the next genome..."
done

echo "All genomes have been scaffolded successfully!"
