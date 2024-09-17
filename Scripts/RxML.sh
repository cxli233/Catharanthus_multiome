#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=100:00:00
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=16
#SBATCH --mem-per-cpu=5G
#SBATCH --job-name=build_tree
#SBATCH --output=%x_%j.out		# Standard output log, e.g., testBowtie2_12345.out
#SBATCH --error=%x_%j.err		# Standard error log, e.g., testBowtie2_12345.err
#SBATCH --mail-user=cl56619@uga.edu    # Where to send mail
#SBATCH --mail-type=BEGIN,END,FAIL          	# Mail events (BEGIN, END, FAIL, ALL)


ml RAxML/8.2.12-GCC-10.2.0-pthreads-avx2

cd /scratch/cl56619/MYB
raxmlHPC -s Results/test.fasta.aln -f a -m PROTGAMMAAUTO -n Rmyb_out -x 666 -N 250 -p 666 -T 4
