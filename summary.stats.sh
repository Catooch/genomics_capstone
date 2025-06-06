#Counting reads

#!/bin/bash

# Create CSV header
echo "sample,metric,value" > results/alignment_summary2.csv

# Loop through each sample
for sample in SRR2584863 SRR2584866 SRR2589044; do

    echo "Processing $sample..."

    # Count raw reads (forward read only)
    raw_count=$(zcat data/raw_fastq/${sample}_1.fastq.gz | wc -l)
    raw_count=$((raw_count / 4))

    # Count trimmed paired reads (forward read only)
    trimmed_count=$(zcat data/trimmed_fastq/${sample}_1.paired.fastq.gz | wc -l)
    trimmed_count=$((trimmed_count / 4))

    # Count aligned reads (reads that mapped, not flagged as unmapped)
    aligned_count=$(samtools view -c -F 0x4 results/bam/${sample}.sorted.bam)

    # Count number of variants called (excluding header lines in VCF)
    variant_count=$(grep -v "^#" results/vcf/${sample}.vcf | wc -l)

    # Save to CSV
    echo "${sample},raw_reads,${raw_count}" >> results/alignment_summary.csv
    echo "${sample},trimmed_reads,${trimmed_count}" >> results/alignment_summary2.csv
    echo "${sample},aligned_reads,${aligned_count}" >> results/alignment_summary2.csv
    echo "${sample},variants,${variant_count}" >> results/alignment_summary2.csv

done

echo "Summary written to results/alignment_summary.csv"

