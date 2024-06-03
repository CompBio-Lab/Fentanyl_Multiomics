# QC Metrics 

This section includes the code for the quality control analysis for both gene expression (GEX) and chromatin accessibility (ATAC) datasets. While the data was profiled together (10x Genomics Multiomics), we have separately done individual quality control. This is because GEX and ATAC have different QC metrics. 

For GEX, we first removed all mitochondrial genes and then subsetted the seurat object by removing all cells that had less than a 100 features and more than 7500 features (doublets). 

For ATAC, while creating the ChromatinAssay Object, we included features detected in at least 100 cells and include cells with atleast 200 features. Additionally, looking at nucleosome signal and TSS.Enrichement scores, we subsetted the dataset removing poor qualitly cells (i.e. keeping cells with a nucleosome signal less than 5 and a TSS.enrichement score greater than 0.5)

Then, we found the common cell barcodes between the two datasets and saved it as an rds to then subset the original GEX and ATAC datasets to be used for further downstream analysis. 