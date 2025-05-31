#!/bin/bash

#Setting Paths
GENOME_DIR=~Desktop/Maniacs/Phylo_genomics/Masked_genomes #Input dir
OUTPUT_DIR=~/Desktop/Maniacs/Phylo_genomics/Gene_prediction/augustus_results # Output directory
SPECIES=Ustilago maydis # Replace with your trained model

mkdir -p "$OUTPUT_DIR"

for GENOME in "$GENOME_DIR"/*/*.masked; do
    BASENAME=$(basename "$GENOME" .masked)
    echo "Running AUGUSTUS on $BASENAME..."

    # Output paths
    GFF_FILE="$OUTPUT_DIR/${BASENAME}_data_GTF_GFF.gff"
    CDS_FILE="$OUTPUT_DIR/${BASENAME}_Coding_sequence.fasta"
    PROT_FILE="$OUTPUT_DIR/${BASENAME}_protein_sequence.fasta"

    # Run AUGUSTUS
    augustus \
        --species="$SPECIES" \
        --softmasking=1 \
        --gff3=on \
        --outfile="$GFF_FILE" \
        --codingseq=on \
        --codingseqfile="$CDS_FILE" \
        --protein=on \
        --proteinfile="$PROT_FILE" \
        "$GENOME"

    echo "$BASENAME prediction completed."
done

echo "All genomes processed!"
