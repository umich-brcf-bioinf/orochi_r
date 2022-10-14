FROM bioconductor/bioconductor_docker:RELEASE_3_15

RUN Rscript -e "\
    install.packages(c( \
        'ComplexUpset', \
        'devtools', \
        'gamlss', \
        'GGally', \
        'ggfortify', \
        'ggpubr', \
        'ggrepel', \
        'gplots', \
        'kableExtra', \
        'knitr', \
        'openxlsx', \
        'optparse', \
        'pheatmap', \
        'RColorBrewer', \
        'rmarkdown', \
        'roxygen2', \
        'statmod', \
        'testthat', \
        'tidyverse', \
        'UpSetR'), ask = FALSE, update = FALSE); \
    BiocManager::install(c( \
        'BiocStyle', \
        'annotatr', \
        'BSgenome.Hsapiens.UCSC.hg19', \
        'BSgenome.Hsapiens.UCSC.hg38', \
        'BSgenome.Mmusculus.UCSC.mm10', \
        'BSgenome.Dmelanogaster.UCSC.dm6', \
        'BSgenome.Drerio.UCSC.danRer11', \
        'BSgenome.Ggallus.UCSC.galGal6', \
        'bsseq', \
        'chipenrich', \
        'DelayedArray', \
        'DESeq2', \
        'DMRcate', \
        'edgeR', \
        'ENmix', \
        'FlowSorted.Blood.EPIC', \
        'FlowSorted.CordBlood.450k', \
        'GO.db', \
        'IlluminaHumanMethylation450kmanifest', \
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
        'rtracklayer', \
        'sesame', \
        'TxDb.Dmelanogaster.UCSC.dm6.ensGene', \
        'TxDb.Drerio.UCSC.danRer11.refGene', \
        'TxDb.Ggallus.UCSC.galGal6.refGene', \
        'TxDb.Hsapiens.UCSC.hg19.knownGene', \
        'TxDb.Hsapiens.UCSC.hg38.knownGene', \
        'TxDb.Mmusculus.UCSC.mm10.knownGene', \
        'TxDb.Rnorvegicus.UCSC.rn6.refGene'), ask = FALSE, update = FALSE); \
    devtools::install_github(c( \
        'achilleasNP/IlluminaHumanMethylationEPICmanifest',\
        'achilleasNP/IlluminaHumanMethylationEPICanno.ilm10b5.hg38'), dependencies = TRUE);"
