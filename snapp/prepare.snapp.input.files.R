library(vcfR)
library(SNPfiltR)

#read in vcfr
vcfR <- read.vcfR("~/Desktop/mex.towhees/towhee.75.mac2.unlinked.nomito.vcf")
dim(vcfR)

for (i in 1:3){
  #randomly sample 1 sample from each of the K=8 sampling localities
  #remember that the first column of a vcfR object is 'INFO' and samples start in column 2
  sample.specs<-c(sample(c(2,3,20,21),size = 2),sample(c(4:7),size = 2),sample(c(8:11),size = 2),
                  sample(c(12:15),size = 2),sample(c(16:19),size = 2),sample(c(22:25),size = 2),
                  sample(c(26:29),size = 2),sample(c(30:33),size = 2))
  #subset the random samples plus the vcfR info (column 1)
  vcf.sub <- vcfR[,c(1,sample.specs)]
  #filter out invariant sites
  vcf.comp<-min_mac(vcf.sub, min.mac = 1)
  #write filtered subset vcf to disk
  vcfR::write.vcf(vcf.comp, file = paste0("~/Desktop/mex.towhees/snapp/rep",i,".vcf.gz"))
}

#now unzip each vcf file and use PGDspider to convert each file into a binary nexus file
#open beauti and choose file > template > SNAPP.
#open first nexus, assign samples to tips, leave parameters default except:
#uncheck the box "Include non-polymorphic sites"
#remove any calibrations in the 'Prior' window (if needed)
#reduce chain length to 5M, and name tree and log filenames according to the replicate

#then repeat for each nexus until all of your beauti .xml input files are ready for SNAPP

#then run replicate SNAPP runs as an array on the cluster using the following code:
#!/bin/sh
#
#SBATCH --job-name=snapp               # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=15               # 40 CPU allocation per Task
#SBATCH --partition=bi            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/towhees/snapp    # Set working d$
#SBATCH --mem-per-cpu=800            # memory requested
#SBATCH --array=1-3
#SBATCH --time=20000

#/home/d669d153/work/beast/bin/beast -threads 15 rep$SLURM_ARRAY_TASK_ID.xml
