# Spatial Analysis (CosMx Nanostring Spatial Molecular Imager)

To start analysing the spatial data, we first created a seurat object using the fov annotations and raw data obtained from Nanostring. We first identified spatially variable genes using *Voyager* which calculates spatial autocorrelation (Moran's I). Then, we conducted spatially resolved clustering using *BayesSpace*. 