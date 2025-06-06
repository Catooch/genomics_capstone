#Aligning reads
mkdir -p results/sam

for sample in SRR2584863 SRR2584866 SRR2589044
do
  bwa mem data/genomes/ecoli_rel606.fna \
    data/trimmed_fastq/${sample}_1.paired.fastq.gz \
    data/trimmed_fastq/${sample}_2.paired.fastq.gz \
    > results/sam/${sample}.sam
done

