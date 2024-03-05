#!/bin/bash
#SBATCH --job-name=CRO_MACS2
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

cd /scratch/cl56619/DAP_seq/Results/cro_BWA_out
ml MACS2/2.2.7.1-foss-2019b-Python-3.7.4

for bam in *.dedup.bam
do
mkdir ../MACS2_out/${bam/.dedup.bam/}/
macs2 callpeak -t $bam \
-c CRO_BP_S16_L001.dedup.bam \
-g 444800000 \
--outdir ../MACS2_out/${bam/.dedup.bam/}/
done
