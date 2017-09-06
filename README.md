# BrapaNetworks

This repository is for building networks from B.rapa RIL RNAseq data.

I have taken two approaches: using mutual ranks and using WGCNA.

The main scripts are the .RMD files. 

* `MR Clustering CR UN.Rmd` Builds mutual rank networks centered on traits of interest
* `WGCNA_CR.Rmd` and `WGCNA_UN.Rmd` build WGCNA networks (CR is for data in the CRowded treatment and UN is for data from the UNcrowded treatment)
* `QTL_Annotation_MR_Genes.Rmd` looks for overlaps betweeen network genes and QTL
* `analyze_eigengene_QTL.Rmd` maps QTL for the WGCNA eigen genes (cluster centers)
* `MR_eQTL_Overlap.Rmd` maps eQTL for the MR genes and then looks for overlap between those eQTL and trait QTL

