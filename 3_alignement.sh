
wget ftp://ftp.ensembl.org/pub/release-107/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
gunzip Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
bowtie2-build Homo_sapiens.GRCh38.dna.primary_assembly.fa GRCh38_noalt_as

#!/bin/bash

# Define the base directory where your sample folders are located
base_dir=""

# List of your sample names (just the folder names)
samples=(
  ""
  ""
)

# Bowtie2 index base
index=GRCh38_noalt_as

# Loop over each sample
for sample in "${samples[@]}"; do
  # Define the full path to the input files
  R1_file="${base_dir}/${sample}/${sample}_trimmed_1.fq.gz"
  R2_file="${base_dir}/${sample}/${sample}_trimmed_2.fq.gz"
  
  # Define the output file path for the SAM file
  output_sam="${base_dir}/${sample}/${sample}.sam"
  
  # Check if both input files exist
  if [[ -f "$R1_file" && -f "$R2_file" ]]; then
    # Run bowtie2 to align the paired-end reads
    bowtie2 -x "$index" -p 6 -1 "$R1_file" -2 "$R2_file" -S "$output_sam"
    echo "Alignment completed for ${sample}"
  else
    echo "Input files for ${sample} not found. Skipping."
  fi
done



