# Use the official R base image
FROM r-base:latest

# Install Bioconductor and required dependencies
RUN apt-get update && \
    apt-get install -y \
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev \
        wget && \
    R -e 'install.packages("BiocManager")' && \
    R -e 'BiocManager::install("limma")'

# Install dplyr from CRAN
RUN R -e 'install.packages("dplyr")'

# set working directory
WORKDIR /home
