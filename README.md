# BrapaNetworks

This repository is for building networks from B.rapa RIL RNAseq data.

I have taken two approaches: using mutual ranks and using WGCNA.

** Mar 28, 2018 ** I reorganized the repo into "scripts", "input", "output", and "presentations".  Many file links will be broken.

** Mar 28, 2018 ** Current plan is to *only* analyze the "uncrowded" data and to look at correlations between the networks and both the 2011 and 2012 growth data.

The main scripts are the .RMD files. 

* `01_Process Counts.Rmd` starts from RNAseq counts, normalizes and voom transforms in preparation for network building.
* `02_MR Clustering UN.Rmd` Builds mutual rank networks centered on traits of interest
* `03_QTL_Annotation_MR_Genes.Rmd` looks for overlaps between network genes and QTL
* `04_MR_eQTL_Overlap.Rmd` maps eQTL for the MR genes and then looks for overlap between those eQTL and trait QTL
* `05_WGCNA_UN.Rmd` build WGCNA networks
* `05b_WGCNA_UN_multi.Rmd` testing different parameters on WGCNA.  Also repeatability.
* `06_get_eigengene_QTL.Rmd` maps QTL for the WGCNA eigen genes (cluster centers)
* `07_analyze_eigengene_QTL.Rmd` 


