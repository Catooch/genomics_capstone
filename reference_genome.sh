
# Have convenient place to call reference genome

genome_url=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/017/985/GCA_000017985.1_ASM1798v1/GCA_000017985.1_ASM1798v1_g$
## Making genome directory
mkdir data/genomes

wget -O data/genomes/ecoli_rel606.fna.gz $genome_url
