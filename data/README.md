vcf files containing SNP data for this project. File 'genotyped_X_samples_snps.vcf' contains all unfiltered SNPs output by the GATK SNP calling pipeline. The file 'genotyped_X_samples_only_PASS_snp.vcf' contains SNPs passing the specified GATK filters (SNPs removed if <5 bps from any insertion or deletion, found in a cluster of 3 or more SNPs within a 10 base pair window, SNP quality score <30, SNP quality score/allele depth <5, or strand bias >60). File 'towhee.75.mac2.nomito.vcf' contains SNPs passing GATK and SNPfiltR filtering protocols, and has SNPs from a single scaffold identified as mitochondrial removed. File 'towhee.75.mac2.unlinked.nomito.vcf' identical to file 'towhee.75.mac2.nomito.vcf' except SNPs are thinned to a single SNP per UCE locus.