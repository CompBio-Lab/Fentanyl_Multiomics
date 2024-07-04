# QC Metrics 

This section includes the code for the quality control analysis for both gene expression (GEX) and chromatin accessibility (ATAC) datasets.First we created separate objects for GEX (seurat) and ATAC (ChromatinAssay object). Then we added the ATAC layer into the seurat object with the GEX data. 

For GEX, we removed all mitochondrial genes and then subsetted the seurat object by removing all cells that had less than a 100 features and more than 7500 features (doublets). For ATAC, we included features detected in at least 100 cells and include cells with atleast 200 features. Additionally, looking at nucleosome signal and TSS.Enrichement scores, we subsetted the dataset removing poor qualitly cells (i.e. keeping cells with a nucleosome signal less than 5 and a TSS.enrichement score greater than 0.5)

This object was then used for the next step of clustering and annotation. 