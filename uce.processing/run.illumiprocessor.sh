#!/bin/sh
#
#SBATCH --job-name=towhee.illumiprocessor
#SBATCH --partition=bi
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=10
#SBATCH --time=1500
#SBATCH --mem=20G
#SBATCH --chdir=/home/d669d153/work/towhees/uces

#activate phyluce
source activate phyluce

# run illumiprocessor

illumiprocessor \
    --input raw-fastq/ \
    --output clean-fastq \
    --config illumi_towhee.conf \
    --cores 10 \
    --r1-pattern _R1 \
    --r2-pattern _R2