# BrapaNetworks

This repository contains code for building networks from B.rapa RIL RNAseq data described in [Baker et al, 2019](MaloofLab/Baker-2019-PLosG-Brapa-neworks)

I have taken two approaches: using mutual ranks and using WGCNA.

The main scripts are the .RMD files. 

* `00_Annotation.Rmd` blast to annotate B. rapa genes based on Arabidopsis homologs.
* `01_Process Counts.Rmd` starts from RNAseq counts, normalizes and voom transforms in preparation for network building.
* `02_MR Clustering UN.Rmd` Builds mutual rank networks centered on traits of interest
* `03_QTL_Annotation_MR_Genes.Rmd` looks for overlaps between network genes and QTL
* `04_MR_eQTL_Overlap.Rmd` maps eQTL for the MR genes and then looks for overlap between those eQTL and trait QTL
* `05_WGCNA_UN.Rmd` build WGCNA networks
* `05b_WGCNA_UN_multi.Rmd` testing different parameters on WGCNA.  Also repeatability.
* `06_get_eigengene_QTL.Rmd` maps QTL for the WGCNA eigen genes (cluster centers)
* `07_analyze_eigengene_QTL.Rmd` 
* `08_eigen_gene_module_correlation.Rmd` Further examining eigen genes and modules
* `09_Bel1_SNPs.Rmd` Look for SNPs in Bel1 gene
* `10_MR_SNPs.Rmd` find SNPs in MR genes.



