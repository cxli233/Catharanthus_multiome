#!/bin/bash
#SBATCH --job-name=peak_coverage
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

cd /scratch/cl56619/DAP_seq/Results/bedtools_out/
ml BEDTools/2.30.0-GCC-8.3.0


bedtools coverage -a cro_v3.10.bed \
-b CRO_halo.bed | cut -f1,2,3,4 > CRO_halo.10.bedgraph

bedtools coverage -a cro_v3.10.bed \
-b ORCA3.bam.bed | cut -f1,2,3,4 > ORCA3.bam.10.bedgraph

bedtools coverage -a cro_v3.10.bed \
-b ORCA4.bam.bed | cut -f1,2,3,4 > ORCA4.bam.10.bedgraph

bedtools coverage -a cro_v3.50.bed \
-b CRO_halo.bed | cut -f1,2,3,4 > CRO_halo.50.bedgraph

bedtools coverage -a cro_v3.50.bed \
-b ORCA3.bam.bed | cut -f1,2,3,4 > ORCA3.bam.50.bedgraph

bedtools coverage -a cro_v3.50.bed \
-b ORCA4.bam.bed | cut -f1,2,3,4 > ORCA4.bam.50.bedgraph
