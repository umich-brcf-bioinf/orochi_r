FROM bioconductor/bioconductor_docker:RELEASE_3_17

ENV OMP_NUM_THREADS=1
ENV OPENBLAS_NUM_THREADS=1

RUN git clone https://github.com/bmbolstad/preprocessCore.git; \
    R CMD INSTALL --configure-args="--disable-threading" preprocessCore/;

RUN Rscript -e "\
    BiocManager::install(c( \
        'annotatr', \
        'BiocStyle', \
        'BSgenome.Hsapiens.UCSC.hg19', \
        'BSgenome.Hsapiens.UCSC.hg38', \
        'BSgenome.Mmusculus.UCSC.mm10', \
        'BSgenome.Dmelanogaster.UCSC.dm6', \
        'BSgenome.Drerio.UCSC.danRer11', \
        'BSgenome.Ggallus.UCSC.galGal6', \
        'bsseq', \
        'chipenrich', \
        'ComplexUpset', \
        'DelayedArray', \
        'DESeq2', \
        'devtools', \
        'DMRcate', \
        'DMRcatedata', \
        'e1071', \
        'edgeR', \
        'ENmix', \
        'FlowSorted.Blood.EPIC', \
        'FlowSorted.CordBlood.450k', \
        'gamlss', \
        'GGally', \
        'ggfortify', \
        'ggpubr', \
        'ggrepel', \
        'gplots', \
        'GO.db', \
        'IlluminaHumanMethylation450kmanifest', \
        'kableExtra', \
        'knitr', \
        'limma', \
        'methylSig', \
        'minfi', \
        'MLML2R', \
        'org.Dm.eg.db', \
        'org.Dr.eg.db', \
        'org.Gg.eg.db', \
        'org.Hs.eg.db', \
        'org.Mm.eg.db', \
        'org.Rn.eg.db', \
        'openxlsx', \
        'optparse', \
        'pals', \
        'pheatmap', \
        'randomForest', \
        'RColorBrewer', \
        'rmarkdown', \
        'roxygen2', \
        'rtracklayer', \
        'sesame', \
        'statmod', \
        'testthat', \
        'tidyverse', \
        'TxDb.Dmelanogaster.UCSC.dm6.ensGene', \
        'TxDb.Drerio.UCSC.danRer11.refGene', \
        'TxDb.Ggallus.UCSC.galGal6.refGene', \
        'TxDb.Hsapiens.UCSC.hg19.knownGene', \
        'TxDb.Hsapiens.UCSC.hg38.knownGene', \
        'TxDb.Mmusculus.UCSC.mm10.knownGene', \
        'TxDb.Rnorvegicus.UCSC.rn6.refGene', \
        'UpSetR', \
        'yaml'), ask = FALSE, update = FALSE, configure.args = '--disable-threading'); \
    devtools::install_github(c( \
        'achilleasNP/IlluminaHumanMethylationEPICmanifest',\
        'achilleasNP/IlluminaHumanMethylationEPICanno.ilm10b5.hg38'), dependencies = TRUE);"
