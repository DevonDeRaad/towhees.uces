#!/bin/sh
#
#SBATCH --job-name=towhee.illumiprocessor
#SBATCH --partition=bi
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --ntasks-per-node=1
#SBATCH --time=1500
#SBATCH --mem=40G
#SBATCH --chdir=/home/d669d153/work/towhees/uces
#SBATCH --array=1-32


#split original conf file into a separate file for each sample
#split -d -l 1 original.assembly.conf assembly.conf
#remove [sample] file
#rm assembly.conf00
#add a line that says '[sample]' at the top of each remaining file
#sed -i '1s/^/[samples]\n/' assembly.conf*
#rename first 10 to match syntax:
#mv assembly.conf01 assembly.conf1
#mv assembly.conf02 assembly.conf2
#mv assembly.conf03 assembly.conf3
#mv assembly.conf04 assembly.conf4
#mv assembly.conf05 assembly.conf5
#mv assembly.conf06 assembly.conf6
#mv assembly.conf07 assembly.conf7
#mv assembly.conf08 assembly.conf8
#mv assembly.conf09 assembly.conf9

#activate
source activate phyluce

#spawn a job for each sample and assemble it independently
phyluce_assembly_assemblo_spades --config assembly.conf$SLURM_ARRAY_TASK_ID --output spades-output_$SLURM_ARRAY_TASK_ID --cores 2
