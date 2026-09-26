FROM bioconductor/bioconductor_docker:RELEASE_3_23-r-4.6.1

# Bioconductor packages are fixed by the release above; CRAN packages by this snapshot date
ARG CRAN_SNAPSHOT=2026-09-25

ENV OMP_NUM_THREADS=1
ENV OPENBLAS_NUM_THREADS=1

COPY packages.txt install.R check.R /opt/orochi_r/

# Installs the packages and records installed_packages.tsv and session_info.txt in /opt/orochi_r
RUN Rscript /opt/orochi_r/install.R ${CRAN_SNAPSHOT} /opt/orochi_r

RUN Rscript /opt/orochi_r/check.R
