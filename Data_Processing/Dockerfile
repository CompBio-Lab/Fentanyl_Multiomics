FROM ubuntu:mantic-20230926

ARG FASTQC_VER="0.11.8"

# install dependencies; cleanup apt garbage
RUN apt-get update && apt-get install -y \
 unzip \
 wget \
 make \
 perl \
 default-jre && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/*

# install fastqc
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VER}.zip && \
    unzip fastqc_v${FASTQC_VER}.zip && \
    rm fastqc_v${FASTQC_VER}.zip && \
    chmod +x FastQC/fastqc
ENV PATH="${PATH}:/FastQC/"

# install cellranger
# https://www.10xgenomics.com/support/software/cell-ranger/downloads
RUN wget -O cellranger-7.2.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.2.0.tar.gz?Expires=1699335877&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=JOCy08Td4ZsoRZq4sUdNhMYbTPM8j9uatmZnUkZSPyjrcHZ3imAWQkR9wMMPq9yQsN~VpiY3N6e9MqukdBTVCPhaXI1mDBIylHGF7IHB2wF3XOCOWkZlkUt1Ry3MvulfDbAw~EMQaDcoi-ns~Er20PnuqhOVIjqk3UxHs-gdAkLxL5ZD754lqlV0jDsAUN63oXV5FhzOl0U4Pr2o2RKADfW~x4L8DSdRTbPigTSP-qmYXSTHwUh-45tK8Mb6KLUNy5kJM8tPajlyjzPY26p858TYyENA4lcrn6QH7qzu0F0JraDTQqeB9xSI~04FPVv8OxVaVATkdujjB5LFXyGLDw__" && \ 
    tar -zxvf cellranger-7.2.0.tar.gz && \
    cd cellranger-7.2.0
ENV PATH="${PATH}:/cellranger-7.2.0/"

# set working directory
WORKDIR /home
