#!/bin/bash

# To simply aggregate the Quality control results of the genome assemblies from both tools(Busco and Quast)
# Ensure both results output are in the same directory
# Navigate to the directory and run multiqc

multiqc . # This will scam through the results and aggregate them into a single comprehensive report
