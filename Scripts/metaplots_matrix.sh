#!/bin/bash
#SBATCH --job-name=metaplot_matrix
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=128gb
#SBATCH --cpus-per-task=16
#SBATCH --time=168:00:00
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err
#SBATCH --mail-user=cl56619@uga.edu
#SBATCH --mail-type=ALL

cd $SLURM_SUBMIT_DIR
cd /scratch/cl56619/metaplots/Data

ml deepTools/3.5.1-intel-2020b-Python-3.8.6

# Make matrix
## ATAC seq at genes
# computeMatrix scale-regions -S CRO2_ATAC.bigwig \
#                            -R genes.bed \
#                            --beforeRegionStartLength 3000 \
#                            --regionBodyLength 5000 \
#                            --afterRegionStartLength 3000 \
#                            -out ../Results/ATAC2_genes_matrix.tab.gz \
#                            --skipZeros

# computeMatrix scale-regions -S CRO3_ATAC.bigwig \
#                            -R genes.bed \
#                            --beforeRegionStartLength 3000 \
#                            --regionBodyLength 5000 \
#                            --afterRegionStartLength 3000 \
#                            -out ../Results/ATAC3_genes_matrix.tab.gz \
#                            --skipZeros

# computeMatrix scale-regions -S CRO4_ATAC.bigwig \
#                            -R genes.bed \
#                            --beforeRegionStartLength 3000 \
#                            --regionBodyLength 5000 \
#                            --afterRegionStartLength 3000 \
#                            -out ../Results/ATAC4_genes_matrix.tab.gz \
#                            --skipZeros


## ATAC seq at peaks
# computeMatrix reference-point -S CRO2_ATAC.bigwig \
#                            -R MACS2_broad_peaks.bed \
#                            --referencePoint center \
#                            -b 2000 \
#                            -a 2000 \
#                            -out ../Results/ATAC2_peaks_matrix.tab.gz \
#                            --skipZeros

#computeMatrix reference-point -S CRO3_ATAC.bigwig \
#                            -R MACS2_broad_peaks.bed \
#                            --referencePoint center \
#                            -b 2000 \
#                            -a 2000 \
#                            -out ../Results/ATAC3_peaks_matrix.tab.gz \
#                            --skipZeros

computeMatrix reference-point -S CRO4_ATAC.bigwig \
                            -R MACS2_broad_peaks.bed \
                            --referencePoint center \
                            -b 2000 \
                            -a 2000 \
                            -out ../Results/ATAC4_peaks_matrix.tab.gz \
                            --skipZeros

## DAP-seq at genes
# computeMatrix scale-regions -S CRO_BH_S3_L001.dedup.bigWig \
#                            -R genes.bed \
#                            --beforeRegionStartLength 3000 \
#                            --regionBodyLength 5000 \
#                            --afterRegionStartLength 3000 \
#                            -out ../Results/ORCA3_genes_matrix.tab.gz \
#                            --skipZeros

# computeMatrix scale-regions -S CRO_BI_S4_L001.dedup.bigWig \
#                              -R genes.bed \
#                              --beforeRegionStartLength 3000 \
#                              --regionBodyLength 5000 \
#                              --afterRegionStartLength 3000 \
#                              -out ../Results/ORCA4_genes_matrix.tab.gz \
#                              --skipZeros

## DAP-seq at peaks
### ORCA3 on ORCA3 peaks
computeMatrix reference-point -S CRO_BH_S3_L001.dedup.bigWig \
                            -R CRO_BH_S3.MACS2.bed \
                            --referencePoint center \
                            -b 2000 \
                            -a 2000 \
                            -out ../Results/ORCA3_peaks_matrix.tab.gz \
                            --skipZeros

### ORCA4 on ORCA4 peaks
computeMatrix reference-point -S CRO_BI_S4_L001.dedup.bigWig \
                            -R CRO_BI_S4.MACS2.bed \
                            --referencePoint center \
                            -b 2000 \
                            -a 2000 \
                            -out ../Results/ORCA4_peaks_matrix.tab.gz \
                            --skipZeros
