
#!/bin/bash 

# Function definitions
function function1()  {
    echo "Executing function 1: Convert SAM to BAM for ${sample}"
    samtools view -S -b "${base_dir}/${sample}/${sample}.sam" > "${base_dir}/${sample}/${sample}.bam"
}

function function2()  {
    echo "Executing function 2: Sort BAM file for ${sample}"
    samtools sort "${base_dir}/${sample}/${sample}.bam" -o "${base_dir}/${sample}/${sample}_sorted.bam"
}

function function3()  {
    echo "Executing function 3: Index BAM file for ${sample}"
    samtools index "${base_dir}/${sample}/${sample}_sorted.bam"
}

function function4()  {
    echo "Executing function 4: Remove SAM file for ${sample}"
    rm "${base_dir}/${sample}/${sample}.sam"
}

# Define the base directory where your sample folders are located
base_dir="/home/apuhart/Desktop/Cut_and_run_Sequencing_Data"

# List of your sample names (just the folder names)
samples=(
  ""
  ""
)

# Loop through each sample
for sample in "${samples[@]}"
do
    echo "Processing $sample"
    
    # Ensure the SAM file exists before proceeding
    if [[ -f "${base_dir}/${sample}/${sample}.sam" ]]; then
        # Call the functions within the loop
        function1
        function2
        function3
        function4
        echo "Finished processing $sample"
    else
        echo "SAM file for ${sample} not found. Skipping."
    fi
done

