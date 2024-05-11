fasta:
	wget https://ftp.ensembl.org/pub/release-110/fasta/rattus_norvegicus/dna/Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa.gz
	gunzip Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa.gz

gtf:
	wget https://ftp.ensembl.org/pub/release-110/gtf/rattus_norvegicus/Rattus_norvegicus.mRatBN7.2.110.gtf.gz
	gunzip Rattus_norvegicus.mRatBN7.2.110.gtf.gz
	
mkgtf:
	apptainer run -B /project/st-singha53-1/rishikad/snrnaseq/ /project/st-singha53-1/rishikad/snrnaseq/snrnaseq.sif cellranger mkgtf \
		/project/st-singha53-1/rishikad/snrnaseq/2_cellranger/ref/Rattus_norvegicus.mRatBN7.2.110.gtf \
		Rattus_norvegicus.mRatBN7.2.filtered.gtf \
		--attribute=gene_biotype:protein_coding

mkref:
	cellranger mkref \
	  --genome=Rattus_norvegicus_mRatBN7_2 \
	  --fasta=/project/st-singha53-1/rishikad/snrnaseq/2_cellranger/ref/rat_ref/Rattus_norvegicus.mRatBN7.2.dna.toplevel.fa \
	  --genes=/project/st-singha53-1/rishikad/snrnaseq/2_cellranger/ref/rat_ref/Rattus_norvegicus.mRatBN7.2.filtered.gtf
