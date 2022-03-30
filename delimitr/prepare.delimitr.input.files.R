library(vcfR)
library(SNPfiltR)
vcfR <- read.vcfR("~/Desktop/mex.towhees/towhee.75.mac2.unlinked.nomito.vcf")
vcfR
#read in sample info csv
sample.info<-read.csv("~/Desktop/mex.towhees/sample.locs.csv")

#reorder sampling file to match order of samples in vcf
sample.info<-sample.info[match(colnames(vcfR@gt)[-1], sample.info$ID),]
sample.info$ID == colnames(vcfR@gt)[-1]
sample.info$sample.loc<-as.character(sample.info$sample.loc)
pops<-c("mac","mac", rep("hyb", times=4),rep("ocai", times=4),
        rep("mac", times=10),rep("hyb", times=4),rep("mac", times=4),rep("ocai", times=4))

#write pops.file for this dataset
write.table(cbind(colnames(vcfR@gt)[-1], pops),
            "~/Desktop/mex.towhees/delimitr/towhee.pops.file.txt", quote = F, row.names = F, col.names = F)

#Run in a local terminal window
#cd ~/Desktop/mex.towhees/delimitr
#conda activate easySFS
#/Users/devder/easySFS/easySFS.py -i ~/Desktop/mex.towhees/towhee.75.mac2.unlinked.nomito.vcf -p towhee.pops.file.txt --preview
#/Users/devder/easySFS/easySFS.py -i ~/Desktop/mex.towhees/towhee.75.mac2.unlinked.nomito.vcf -p towhee.pops.file.txt --proj 24,12,14
#mv output towhee.output

#write a traits file where:
#0 = mac
#1 = hyb
#2 = ocai

#make name vector
tow<-c()
for (i in 1:50){tow[i]<-paste0("tow_",i)}
#write to disk
write.table(cbind(tow, c(rep(0,times=24),rep(1,times=12),rep(2,times=14))),
            "~/Desktop/mex.towhees/delimitr/towhee.traits.file.txt", quote = F, row.names = F,
            col.names = c("traits","species"), sep = '\t')

