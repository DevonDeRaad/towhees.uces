Spotted / Collared Towhee Transvolcanic Hybrid Zone Genomic Investigation
==================================================================================

This repository contains a comprehensive compilation of code and expalantory visualizations associated with the paper: "Towhee Hybrid Zone"

### Data Processing
*   Scripts used for cleaning, processing, assembling, and calling SNPs from UCEs can be found here:
    > <https://github.com/DevonDeRaad/towhees.uces/tree/main/uce.processing>
*   Filtering SNPs called from UCEs and investigating the effects of missing data using [SNPfiltR](https://github.com/DevonDeRaad/SNPfiltR) can be followed here:
    > <https://devonderaad.github.io/towhees.uces/uce.processing/towhee.filt.html>    
*   Scripts for assembling mitochondrial genomes using [MITObim](https://github.com/chrishah/MITObim) can be followed here:
    > <https://github.com/DevonDeRaad/towhees.uces/tree/main/mito.processing>

### Population Genetic Analyses
*   Using the R package introgress to identify fixed differences between cline ends and search for recently backcrossed individuals (plus identify and remove mitchondrial putative UCE scaffold) can be found here:
    > <https://devonderaad.github.io/towhees.uces/popgen.analyses/towhee.introgress.html>  
*   Generating sampling maps, PCAs, pairwise Fst matrices, splitstrees, etc. using R:
    > <https://devonderaad.github.io/towhees.uces/popgen.analyses/towhee.popgen.html>  
*   Testing for correlations between genomic ancestry and phenotypic characteristics is performed here:
    > <https://devonderaad.github.io/towhees.uces/pheno.geno.corrs/pheno.geno.corrs.html> 
*   Running HZAR to model transistions along the sampling transect for phenotypic and genomic characters:
    > <https://devonderaad.github.io/towhees.uces/towhee.hzar.html>  
*   Running EEMS to fit a model of isolation by distance along the sampling transect:
    > <https://devonderaad.github.io/towhees.uces/EEMS/towhee.eems.html>  
*   Calculating and visualizing nucleotide diversity for each sampling locality along the transect:
    > <https://devonderaad.github.io/towhees.uces/pixy/towhee.pixy.het.html>  
*   Simulating various demographic models to compare summary statistics against empirical data:
    > <https://devonderaad.github.io/towhees.uces/sims/towhee.slendr.sims.html>  
