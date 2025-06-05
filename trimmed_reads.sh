# Trimming

# Load Trimmomatic
module load Trimmomatic/0.39-Java-13

# Define variables
TRIMMOMATIC="java -jar /apps/eb/Trimmomatic/0.39-Java-13/trimmomatic-0.39.jar"
ADAPTERS="data/adapters/NexteraPE-PE.fa"
RAW_DIR="data/raw_fastq"
TRIMMED_DIR="data/trimmed_fastq"

# Make trimmed directory if it doesn’t exist
mkdir -p $TRIMMED_DIR

# Loop through samples
for sample in SRR2584863 SRR2584866 SRR2589044
do
  $TRIMMOMATIC PE -threads 4 \
    ${RAW_DIR}/${sample}_1.fastq.gz ${RAW_DIR}/${sample}_2.fastq.gz \
    ${TRIMMED_DIR}/${sample}_1.paired.fastq.gz ${TRIMMED_DIR}/${sample}_1.unpaired.fastq.gz \
    ${TRIMMED_DIR}/${sample}_2.paired.fastq.gz ${TRIMMED_DIR}/${sample}_2.unpaired.fastq.gz \
    ILLUMINACLIP:${ADAPTERS}:2:30:10:5:True SLIDINGWINDOW:4:20 MINLEN:50
done

