#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 08:00:00
#SBATCH -J read_counting
#SBATCH -o read_counting.output
#SBATCH -e read_counting.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL
#SBATCH --reservation=uppmax2022-2-5_6

# Load modules
module load bioinfo-tools htseq samtools

# Define paths to different files
bam_files="/home/jobo2160/genome_analysis/Genome-Analysis/code/6_read_mapping/results/*.bam"
bai_files="/home/jobo2160/genome_analysis/Genome-Analysis/code/6_read_mapping/results/*.bai"
gff_file="/home/jobo2160/genome_analysis/Genome-Analysis/code/7_read_counting/PROKKA_04052022_clean.gff"
out="/home/jobo2160/genome_analysis/Genome-Analysis/code/7_read_counting/results/htseq_result.txt"

# Create index for bam files
# for filename in $bam_files; do
# samtools index $filename ${filename/.bam/.bai}
# done

# Run HtSeq for all
htseq-count -r pos -i ID -s no -t CDS  -f bam $bam_files $gff_file > $out

exit 0
