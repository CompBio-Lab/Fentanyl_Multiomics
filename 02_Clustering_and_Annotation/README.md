# Clustering and Annotation 

In this section, we cover the steps for single cell clustering and annotating the UMAP. First we follow the WNN analysis of 10x multiome tutorial by Seurat (https://satijalab.org/seurat/articles/weighted_nearest_neighbor_analysis). This can be found in the clustering_AllenBrain.Rmd. It creates 3 UMAPs; RNA, ATAC and WNN. We used the MapMyCells database by Allen Brain Institute to annotate the clusters with cell types. 

We also wanted to generate a gene activity matrix from the ATAC dataset and hence the code for this can be found in the ATAC_Signac.Rmd. This matrix is used for the differential state analysis. We saved this seurat object separately titled "GEX_ATAC_GA.rds". 