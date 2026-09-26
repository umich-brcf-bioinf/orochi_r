# Fail the build if any package in packages.txt cannot be loaded. BiocManager::install()
# only warns when a package fails to install, so without this a build can succeed with
# packages missing.

pkgs = readLines('/opt/orochi_r/packages.txt')
pkgs = trimws(sub('#.*', '', pkgs))
pkgs = pkgs[pkgs != '']
# GitHub packages are listed as user/repo; the package name is the repo name
pkgs = basename(pkgs)

ok = vapply(pkgs, function(p) suppressPackageStartupMessages(requireNamespace(p, quietly = TRUE)), logical(1))

if (!all(ok)) {
    stop('Failed to load: ', paste(pkgs[!ok], collapse = ', '))
}
message(sprintf('All %d packages load.', length(pkgs)))
