#!/bin/bash

# Directory containing protein fasta files
PROT_DIR=~Desktop/Maniacs/Phylo_genomics/Gene_Prediction/augustus_results
OUT_DIR=~Desktop/Maniacs/Phylo_genomics/Gene_Prediction/eggnog_mapper_results
mkdir -p "$OUT_DIR"


# Loop through protein fasta files
for FILE in "$PROT_DIR"/*_protein_sequence.fasta; do
    BASENAME=$(basename "$FILE" _protein_sequence.fasta)
    echo "Running EggNOG-mapper on $BASENAME..."

    emapper.py \
        -i "$FILE" \
        -o "$OUT_DIR/$BASENAME" \
        --itype proteins \
        --output-dir "$OUT_DIR" \
        --cpu 4

    echo "Annotation for $BASENAME completed."
done

echo "All genomes processed with EggNOG-mapper."
