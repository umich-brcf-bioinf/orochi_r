# Install the packages in packages.txt and record what was installed.
# Usage: Rscript install.R <cran_snapshot_date> <record_dir>

args = commandArgs(trailingOnly = TRUE)
cran_snapshot = args[1]
record_dir = args[2]

# Pin CRAN to a dated Posit Package Manager snapshot. The base image points CRAN at
# a Package Manager URL ending in /latest (or already at a dated snapshot).
cran = getOption('repos')[['CRAN']]
if (grepl('/latest/?$', cran)) {
    cran = sub('/latest/?$', paste0('/', cran_snapshot), cran)
}
if (!grepl('/[0-9]{4}-[0-9]{2}-[0-9]{2}/?$', cran)) {
    stop('CRAN repository is not a dated snapshot, so CRAN packages would not be pinned: ', cran)
}
options(repos = c(CRAN = cran))
message('CRAN repository: ', cran)

pkgs = readLines('/opt/orochi_r/packages.txt')
pkgs = trimws(sub('#.*', '', pkgs))
pkgs = pkgs[pkgs != '']

# preprocessCore must be built from source with threading disabled; multithreaded
# builds caused threading errors in the pipelines. Install it first, from the
# Bioconductor source repository only (the image's binary repository serves Linux
# binaries under src/contrib, so type = 'source' alone would not avoid them), so
# nothing else pulls in the threaded binary.
install.packages('preprocessCore', repos = BiocManager::repositories()[['BioCsoft']],
    type = 'source', configure.args = '--disable-threading')
if (!requireNamespace('preprocessCore', quietly = TRUE)) {
    stop('preprocessCore failed to install from source')
}

# BiocManager hands user/repo names to remotes
if (!requireNamespace('remotes', quietly = TRUE)) {
    install.packages('remotes')
}

BiocManager::install(setdiff(pkgs, 'preprocessCore'), ask = FALSE, update = FALSE)

# Record the installed versions and the R session for the image
dir.create(record_dir, showWarnings = FALSE, recursive = TRUE)
installed = as.data.frame(installed.packages(fields = c('RemoteType', 'RemoteRepo', 'RemoteSha')))
installed = installed[order(installed$Package), c('Package', 'Version', 'LibPath', 'Built', 'RemoteType', 'RemoteRepo', 'RemoteSha')]
write.table(installed, file.path(record_dir, 'installed_packages.tsv'), sep = '\t', quote = FALSE, row.names = FALSE, na = '')
writeLines(c(
    paste('Bioconductor:', BiocManager::version()),
    paste('CRAN:', cran),
    '',
    capture.output(sessionInfo())
), file.path(record_dir, 'session_info.txt'))
