## Alternative process counts script in .R to allow easy running on cabernet.

## Goal is fit GxE model for gene expression, which is too slow to do on my computer

library(tidyverse)
library(edgeR)
library(boxr)
library(magrittr)
box_auth()
box_setwd(24503987860)
box_ls()
library(rio)


## get counts data
#counts <- box_read_tsv(162218089685)
counts <- read_tsv("~/Box Sync/BrapaNetworks/RIL_v1.5_mapping.tsv")
row.names(counts) <- counts$gene
counts <- counts [-1,-1] #remove first row (umapped reads) and first column (gene IDs)
counts[is.na(counts)] <- 0
head(counts[,1:10])
summary(counts[,1:10])

## What are the library sizes like?  Limma users guide says don't need to voom transform if within 3 fold

lib.sizes <- colSums(counts)
range(lib.sizes)
barplot(lib.sizes)
sort(lib.sizes)

#yikes, that isn't going to work.
#remove really small libs
counts <- counts[,lib.sizes>100000]

## set up descriptive data frame
pdata <- colnames(counts) %>% data.frame(file=.,
                                         RIL=regmatches(.,regexpr("RIL_[0-9]*",.)),
                                         trt=regmatches(.,regexpr("CR|UN",.)),
                                         rep=regmatches(.,regexpr("Rep[0-9]*",.)),
                                         stringsAsFactors = FALSE
)
pdata$group <- paste(pdata$RIL,pdata$trt,sep="_")
head(pdata)
tail(pdata)
sort(unique(pdata$RIL))

## create DGE object
counts.dge <- DGEList(counts=counts,group = pdata$group)
counts.dge$samples

## Filter

nrow(counts.dge)
counts.dge <- counts.dge[rowSums(cpm(counts.dge)>5) >= 84,,keep.lib.sizes=FALSE]
counts.dge$samples
nrow(counts.dge)

## Normalize
counts.dge <- calcNormFactors(counts.dge)
counts.dge$samples
counts.log.cpm <- cpm(counts.dge,log=TRUE)

## Alternative 1
## estimate dispersions per group, voom transorm, then fit model in limma

design.gr <- model.matrix(~ 0 + pdata$group)
system.time(counts.dge.gr <- estimateDisp(counts.dge,design = design.gr))

system.time(counts.voom.gr <- voom(counts.dge.gr,design = design.gr))

limma.design.int <- model.matrix(~ pdata$RIL*pdata$trt)

fit.int <- lmFit(counts.voom.gr,design=limma.design.int)

fit.int <- eBayes(voom.fit.gr)

topTable.int <- topTableF(voom.fit.gr,number=Inf)


box_save(counts.voom.gr, limma.design.int, fit.int, topTable.int, file_name="voom.int.Rdata")
