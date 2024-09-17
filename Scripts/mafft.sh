#!/bin/bash
#SBATCH --job-name=MYB_alignment
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=48GB
#SBATCH --time=48:00:00
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err
#SBATCH --mail-user=cl56619@uga.edu
#SBATCH --mail-type=ALL

cd /scratch/cl56619/MYB

ml MAFFT/7.505-GCC-11.3.0-with-extensions
mafft --anysymbol --maxiterate 1000 --localpair Data/test.fasta > Results/test.fasta.aln
