#!/usr/bin/env/bash

# Downloading the data sets from NCBI
# Install ncbi genome download
pip install ncbi-genome-download

# Download the genomes from the database
# Compile accessions numbers in a file
echo "Starting download"
ncbi-genome-download fungi --assembly-accessions accessions.txt --output-folder puccinia_genomes
