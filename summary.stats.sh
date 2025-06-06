#Counting reads

for sample in SRR2584863 SRR2584866 SRR2589044; do
    count=$(samtools view -c -F 0x4 results/bam/${sample}.sorted.bam)
    echo "${sample},aligned_reads,${count}"
done


##Saving as .csv for next steps
echo "sample,metric,value" > results/alignment_summary.csv
for sample in SRR2584863 SRR2584866 SRR2589044; do
    count=$(samtools view -c -F 0x4 results/bam/${sample}.sorted.bam)
    echo "${sample},aligned_reads,${count}" >> results/alignment_summary.csv
done

