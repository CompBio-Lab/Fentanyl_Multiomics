# Data Processing 

This section includes the code and files needed to do the data pre-processing for the Chromium single cell miltiome ATAC + Gene expression dataset. 

First, with the raw fastq files we conducted fastqc to inspect the quality of our reads. Following this we used `cellranger-arc mkref` to build the rat reference genome and `cellranger-arc count` to normalize and count the reads which outputs the h5 files required for downstream analysis. 

The dockerfile and makefile can be used to build the docker image called `snrnaseq` which contains fastqc and cellranger-arc. 
