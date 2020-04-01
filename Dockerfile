FROM bioconductor/bioconductor_docker:RELEASE_3_10

RUN Rscript -e "\
    install.packages(c( \
        'devtools', \
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
        'tidyverse'), ask = FALSE, update = TRUE); \
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
        'edgeR', \
        'ENmix', \
        'FlowSorted.Blood.EPIC', \
        'FlowSorted.CordBlood.450k', \
        'GO.db', \
        'IlluminaHumanMethylationEPICanno.ilm10b2.hg19', \
        'IlluminaHumanMethylationEPICanno.ilm10b4.hg19', \
        'limma', \
        'minfi', \
        'org.Dm.eg.db', \
        'org.Dr.eg.db', \
        'org.Gg.eg.db', \
        'org.Hs.eg.db', \
        'org.Mm.eg.db', \
        'org.Rn.eg.db', \
        'rtracklayer', \
        'TxDb.Dmelanogaster.UCSC.dm6.ensGene', \
        'TxDb.Drerio.UCSC.danRer11.refGene', \
        'TxDb.Ggallus.UCSC.galGal6.refGene', \
        'TxDb.Hsapiens.UCSC.hg19.knownGene', \
        'TxDb.Hsapiens.UCSC.hg38.knownGene', \
        'TxDb.Mmusculus.UCSC.mm10.knownGene', \
        'TxDb.Rnorvegicus.UCSC.rn6.refGene'), ask = FALSE, update = TRUE); \
    devtools::install_github('sartorlab/methylSig', dependencies = TRUE);"
