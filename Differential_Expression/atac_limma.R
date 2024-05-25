# Differential Expression Analysis of Peaks using Limma Voom 

## Load libraries 
library(limma)

## Load data 
atac <- readRDS("/arc/project/st-singha53-1/rishikad/atac_limma/atac_limma.rds")

## Extract counts 
eset <- atac@assays$ATAC@counts
ids <- unlist(sapply(strsplit(colnames(eset), "_"), function(i) i[[1]]))
sex <- factor(atac@meta.data$sex, levels = c("Male", "Female"))
drug <- factor(atac@meta.data$drug, levels = c("Saline", "Fentanyl"))
cell_labels <- atac@meta.data$celltype

eset <- as.matrix(eset)
library(parallel)
cl <- makeCluster(detectCores())
clusterExport(cl, c("cell_labels", "sex", "drug", "eset"))
top <- parLapply(cl, names(table(cell_labels)), function(cell){
  library(limma);
  cat(cell, fill = TRUE)
  keep <- cell_labels %in% cell
  counts <- eset[, keep]
  dat <- data.frame(sex = sex[keep],
                    drug = drug[keep],
                    subj = gsub("_.*", "", colnames(counts)))
  
  design <- model.matrix(~sex*drug, data = dat)
  vobj_tmp <- voom(counts, design, plot = FALSE)
  dupcor <- duplicateCorrelation(vobj_tmp, design, block = dat$subj)
  vobj <- voom(counts, design, plot = FALSE, block = dat$subj, correlation = dupcor$consensus)
  dupcor <- duplicateCorrelation(vobj, design, block = dat$subj)
  fitDupCor <- lmFit(vobj, design, block = dat$subj, correlation = dupcor$consensus)
  fitDupCor <- eBayes(fitDupCor)
  top_FvsM <- topTable(fitDupCor, coef = "sexFemale", adjust.method = "BH", number = nrow(fitDupCor))
  top_FvsM$comparison <- "Female_vs_Male"
  top_FvsM$gene <- rownames(top_FvsM)
  top_SvsF <- topTable(fitDupCor, coef = "drugFentanyl", adjust.method = "BH", number = nrow(fitDupCor))
  top_SvsF$comparison <- "Saline_vs_Fentanyl"
  top_SvsF$gene <- rownames(top_SvsF)
  top_int <- topTable(fitDupCor, coef = "sexFemale:drugFentanyl", adjust.method = "BH", number = nrow(fitDupCor))
  top_int$comparison <- "drug x sex interaction"
  top_int$gene <- rownames(top_int)
  top <- rbind(top_FvsM, top_SvsF, top_int)
  top$cell <- cell
  top }) 
stopCluster(cl)

top <- Reduce("rbind", top)

## Save top table as rds 
saveRDS(top, file = "top.rds")


