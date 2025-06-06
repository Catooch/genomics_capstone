#Converting to BAM files

## Making directory for BAM files

mkdir -p results/bam



for sample in SRR2584863 SRR2584866 SRR2589044
do
    samtools view -S -b results/sam/${sample}.sam > results/bam/${sample}.bam
    samtools sort -o results/bam/${sample}.sorted.bam results/bam/${sample}.bam
done


