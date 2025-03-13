
#!/bin/bash

# Define the directories where the samples are located
directories=(
  ""
  ""
)

# Loop over each directory and run fastqc on each *_1.fq.gz file
for dir in "${directories[@]}"; do
  # Find all *_1.fq.gz files in the directory
  for file in "$dir"/*_1.fq.gz; do
    # Run fastqc on each found file
    fastqc "$file"
  done
done


# Loop over each directory and run fastqc on each *_2.fq.gz file
for dir in "${directories[@]}"; do
  # Find all *_2.fq.gz files in the directory
  for file in "$dir"/*_2.fq.gz; do
    # Run fastqc on each found file
    fastqc "$file"
  done
done

multiqc .
