#!/bin/bash
#SBATCH --job-name=BWA-aln_CRO
#SBATCH --partition=batch		# Partition name (batch, heighten_p, or gpu_p), _required_
#SBATCH --ntasks=1 		# Run job in single task or in paralelle, _required_
#SBATCH --cpus-per-task=6		# CPU cores per task
#SBATCH --mem=128G			# How much memory per node, _required_
#SBATCH --time=168:00:00		# Time Limit hrs:min:sec or day-hrs:min:sec 2-12:00:00 is 2.5 d, _required_
#SBATCH --export=NONE		# Don't export submit node variables to compute node
#SBATCH --output=%x_%j.out	# Standard output log
#SBATCH --error=%x_%j.err		# Standard error log
#SBATCH --mail-user=cl56619@uga.edu # Send an email when job is done or dead
#SBATCH --mail-type=ALL	# Mail events (BEGIN, END, FAIL, ALL)

cd $SLURM_SUBMIT_DIR		# Change dir to job submission dir (optional)
ml BWA/
ml SAMtools/1.14-GCC-8.3.0

cd Data/fastq
for R1 in CRO*R1.trim.paired.fastq.gz
do bwa mem ../cro_v3_anno/cro_v3.final_asm.fa \
$R1 ${R1/R1/R2} | samtools view -S -b > ${R1/R1.trim.paired.fastq.gz/.bam}
done

mv CRO*.bam ../../Results/cro_BWA_out/
