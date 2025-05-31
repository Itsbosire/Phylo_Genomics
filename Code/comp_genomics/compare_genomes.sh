#!/bin/bash

# Set directories
GENOME_DIR=~/genomes
OUT_DIR=~/comparative_results
mkdir -p "$OUT_DIR/mummer"
mkdir -p "$OUT_DIR/snippy"

# Define reference genome
REF_GENOME="$GENOME_DIR/Pgt_Ug99.fna"

# Loop through all other genomes
for QUERY_GENOME in "$GENOME_DIR"/*.fna; do
    BASENAME=$(basename "$QUERY_GENOME" .fna)

    # Skip if it's the reference itself
    if [[ "$QUERY_GENOME" == "$REF_GENOME" ]]; then
        continue
    fi

    echo "🔬 Aligning $BASENAME to reference using MUMmer..."

    # Run MUMmer alignment
    mkdir -p "$OUT_DIR/mummer/$BASENAME"
    nucmer -p "$OUT_DIR/mummer/$BASENAME/alignment" "$REF_GENOME" "$QUERY_GENOME"
    delta-filter -1 "$OUT_DIR/mummer/$BASENAME/alignment.delta" > "$OUT_DIR/mummer/$BASENAME/filtered.delta"
    show-coords -rcl "$OUT_DIR/mummer/$BASENAME/filtered.delta" > "$OUT_DIR/mummer/$BASENAME/coords.txt"

    echo " MUMmer alignment for $BASENAME completed."

    echo " Running Snippy for SNP/indel calling on $BASENAME..."

    # Run Snippy for variant calling
    mkdir -p "$OUT_DIR/snippy/$BASENAME"
    snippy \
        --outdir "$OUT_DIR/snippy/$BASENAME" \
        --ref "$REF_GENOME" \
        --ctgs "$QUERY_GENOME" \
        --cpus 4

    echo " Snippy analysis for $BASENAME completed."
done

echo " All genome comparisons completed!"
