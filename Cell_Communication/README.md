# Cell Communication 

This directory contains the information required for running scDiffCom a pipeline to understand cell-cell communication within two conditions. The tutorial used can be found here: https://cyrillagger.github.io/scDiffCom/articles/scDiffCom-vignette.html 

ScDiffCom infers how cellular communication changes between two conditions (saline and fentanyl) from scRNAseq data, with the input being a seurat object. 

Important terminology: 
*LRI (ligand-recepor interaction) - a set of genes whose proteins are known to interact during cellular signalling 
*CCI (cell-cell interaction) - a communication signal of the form with emitter cell types expressing the ligand or receiver cell type expressing the receptor. 