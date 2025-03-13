
cd /path/to/directory

#!/bin/bash

# List of sample names (fixed)
samples=(
  ""
  ""
)

# Loop over each sample
for sample in "${samples[@]}"; do
  # Define the input file paths for each sample (assuming the files are in corresponding folders)
  R1_file="${sample}/${sample}_1.fq.gz"
  R2_file="${sample}/${sample}_2.fq.gz"
  
  # Output files (trimmed)
  trimmed_R1="${sample}_trimmed_1.fq.gz"
  trimmed_R2="${sample}_trimmed_2.fq.gz"

  # Check if input files exist
  if [[ -f "$R1_file" && -f "$R2_file" ]]; then
    # Run cutadapt for trimming adapters
    cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
             -o "$trimmed_R1" -p "$trimmed_R2" \
             "$R1_file" "$R2_file" \
             --cores 6 --trim-n -m 22 -O 4
    echo "Trimming completed for ${sample}"
  else
    echo "Files for ${sample} not found. Skipping."
  fi
done




