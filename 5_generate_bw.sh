#!/bin/bash

# Define the base directory where your BAM files are located
base_dir="/home/apuhart/Desktop/Chip-Seq/TEST/F24A430001537_HOMywtkC"

# List of sample names for BigWig creation
samples_with_duplicates=(
  ""
  ""
)

samples_without_duplicates=(
  ""
  ""
)

# Generate BigWig files with duplicates
echo "Generating BigWig files with duplicates..."
for sample in "${samples_with_duplicates[@]}"
do
    bam_file="${base_dir}/${sample}/${sample}_sorted.bam"
    output_file="${base_dir}/${sample}/${sample}_norm.bw"
    
    if [[ -f "$bam_file" ]]; then
        echo "Processing $sample..."
        bamCoverage -b "$bam_file" --normalizeUsing RPKM -o "$output_file" -p 6
        echo "BigWig file generated: $output_file"
    else
        echo "BAM file for $sample not found. Skipping."
    fi
done

# Generate BigWig files without duplicates
echo "Generating BigWig files without duplicates..."
for sample in "${samples_without_duplicates[@]}"
do
    bam_file="${base_dir}/${sample}/${sample}_sorted.bam"
    output_file="${base_dir}/${sample}/${sample}_noDupRPKM.bw"
    
    if [[ -f "$bam_file" ]]; then
        echo "Processing $sample..."
        bamCoverage -b "$bam_file" --normalizeUsing RPKM --ignoreDuplicates -o "$output_file" -p 6
        echo "BigWig file generated: $output_file"
    else
        echo "BAM file for $sample not found. Skipping."
    fi
done

