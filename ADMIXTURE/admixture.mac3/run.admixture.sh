#!/bin/sh
#
#SBATCH --job-name=admixture               # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=5               # 40 CPU allocation per Task
#SBATCH --partition=sixhour            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/towhees/admixture.mac3     # Set working d$
#SBATCH --mem-per-cpu=1gb            # memory requested
#SBATCH --time=200

#convert vcf to plink using stacks
#/home/d669d153/work/stacks-2.41/populations --in_vcf /home/d669d153/work/aph.rad/treemix/unlinked.filtered.recode.vcf -O . --plink
#vcftools --vcf /home/d669d153/work/aph.rad/treemix/unlinked.filtered.recode.vcf --plink

#these don't work (admixture won't take plink for some reason)

#use plink to convert vcf directly to bed format instead:
/home/d669d153/work/plink --vcf /home/d669d153/work/towhees/admixture.mac3/towhee.mac3.vcf --double-id --allow-extra-chr --make-bed --out binary_fileset
#fix chromosome names
cut -f2- binary_fileset.bim  > temp
awk 'BEGIN{FS=OFS="\t"}{print value 1 OFS $0}' temp > binary_fileset.bim
rm temp

#run admixture for a K of 1-10, using cross-validation, with 10 threads
for K in 1 2 3 4 5; 
do /home/d669d153/work/admixture_linux-1.3.0/admixture --cv -j5 -m EM binary_fileset.bed $K | tee log${K}.out;
done

#Which K iteration is optimal according to ADMIXTURE ?
grep -h CV log*.out > log.errors.txt

