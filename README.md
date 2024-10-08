# Single Cell Multiomics Analysis on Rat Brain following Fentanyl Self-Administration 

![Method Overview](Images/method_overview.png)

## Introduction 
This repository includes SnRNAseq and SnATACseq analysis pipeline on the rat midbrain after fentanyl self-administration. This includes the data processing (fastqc, cellranger) and the following downstream analysis: 
* QC metrics 
* WNN Analysis of 10x Multiome (*Seurat*) and cell type annotation (MapMyCells)
* Cell proportions (*scCODA*) 
* Cell specific differential state analysis (*Muscat*) 
* Enriched Pathways (*EnrichR*)
* Cell-cell communication (*scDiffCom*)
* Spatial data analysis (*CosMx*) 

## Reproducibility 
In order to reproduce our analysis, we have created docker images for certain steps (fastqc, cellranger-arc, scCODA, and MultiVI). The Docker and Makefiles can be found in the Data_Processing folder. Follow the steps below to build the docker image locally or through UBC ARC Sockeye. 

### Local 
- create docker image and run container
```
make build
make run
```

- run fastqc in running docker container
```
cd fastqc
make fastqc
```

- push image to DockerHub
* make sure you have a dockerhub account
```
make push
```

### Sockeye

#### clone repo to hpc project folder
- log into sockeye and go to project user folder

```bash
module load git
git clone https://github.com/CompBio-Lab/Fentanyl_Multiomics.git
```

#### pull docker image

```bash
cd fastqc
make sockeye_pull
```
