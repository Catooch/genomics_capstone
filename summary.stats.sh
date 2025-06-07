#Counting read

# Create CSV header
echo "sample,metric,value" > results/alignment_summary3.csv

# Loop through each sample
for sample in SRR2584863 SRR2584866 SRR2589044; do
    echo "Processing $sample..."

    # Count raw reads from both R1 and R2
    raw_count1=$(zcat data/raw_fastq/${sample}_1.fastq.gz | wc -l)
    raw_count2=$(zcat data/raw_fastq/${sample}_2.fastq.gz | wc -l)
    raw_count=$(((raw_count1 + raw_count2) / 4))

    # Count trimmed paired reads from both R1 and R2
    trimmed_count1=$(zcat data/trimmed_fastq/${sample}_1.paired.fastq.gz | wc -l)
    trimmed_count2=$(zcat data/trimmed_fastq/${sample}_2.paired.fastq.gz | wc -l)
    trimmed_count=$(((trimmed_count1 + trimmed_count2) / 4))

    # Count aligned reads (mapped reads only)
    aligned_count=$(samtools view -c -F 0x4 results/bam/${sample}.sorted.bam)

    # Count number of variants called (lines in VCF that are not headers)
    variant_count=$(grep -v "^#" results/vcf/${sample}.vcf | wc -l)

    # Write to CSV
    echo "${sample},raw_reads,${raw_count}" >> results/alignment_summary3.csv
    echo "${sample},trimmed_reads,${trimmed_count}" >> results/alignment_summary3.csv
    echo "${sample},aligned_reads,${aligned_count}" >> results/alignment_summary3.csv
    echo "${sample},variants,${variant_count}" >> results/alignment_summary3.csv
done

