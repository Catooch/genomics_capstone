#Calling variants

# Step 1: mpileup (generate binary BCF file)
for sample in SRR2589044 SRR2584863 SRR2584866
do
    bcftools mpileup -O b -o results/bcf/${sample}.bcf -f data/genomes/ecoli_rel606.fna results/bam/${sample}.sorted.bam
done

# Step 2: call variants from BCF
for sample in SRR2589044 SRR2584863 SRR2584866
do
    bcftools call --ploidy 1 -m -v -o results/vcf/${sample}.vcf results/bcf/${sample}.bcf
done

