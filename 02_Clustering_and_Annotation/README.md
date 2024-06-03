# Clustering and Annotation 

In this section, we cover the steps for single cell clustering and annotating the UMAP. First, we follow the Seurat guided clustering tutorial (https://satijalab.org/seurat/articles/pbmc3k_tutorial.html) using only the RNA subset dataset. This provides us with the UMAP only for gene expression. In order to annotate this UMAP we used `fgsea` with a reference mouse brain atlas. 

To integrate the GEX and ATAC datasets we conducted a joint analysis of paired multiomic data with MultiVI (https://docs.scvi-tools.org/en/stable/tutorials/notebooks/multimodal/MultiVI_tutorial.html). This provides us with a UMAP for both GEX and ATAC data combined. The leiden column (clusters for each cell) was saved as a csv and inputted into the `seurat_clusters` and   `idents` layers within the RNA seurat object.

 This was done in order to perform fgsea again with the updated clusters for the integrated analysis. Once the cell types were obtained, this was then plugged back into the MultiVI object to obtain the integrated and annotated UMAP. 

