# orochi_r
R image for Orochi pipelines

Published as [`umichbfxcore/orochi_r`](https://hub.docker.com/r/umichbfxcore/orochi_r) on Docker Hub.

## Contents

- `packages.txt`: every R package in the image, one per line. CRAN and Bioconductor packages by name, GitHub packages as `user/repo`.
- `install.R`: installs the list with `BiocManager::install()`, pinning CRAN to the snapshot date `CRAN_SNAPSHOT` set in the `Dockerfile`. It builds `preprocessCore` from source with threading disabled, and records the installed versions in `/opt/orochi_r/installed_packages.tsv` and `/opt/orochi_r/session_info.txt`.
- `check.R`: fails the build if any listed package doesn't load.

To add a package, add it to `packages.txt`.

## Versioning

Versions are `X.Y.Z`:

- **Y** changes when the Bioconductor release changes, or when packages are removed.
- **Z** keeps the Bioconductor release and only adds packages or fixes the build. A Z release can still update the versions of existing packages, through a newer CRAN snapshot or Bioconductor patch updates.

Image tags are never re-pushed or overwritten. Fixes go into a new version.

## Releasing a new image

Images are built and pushed by GitHub Actions (`.github/workflows/build.yaml`). Pull requests build the image without pushing it, which checks `Dockerfile` changes before release.

1. Merge the `Dockerfile` changes and a `CHANGELOG` entry for the new version into `master`.
2. Tag the merge commit with the version, without a `v` prefix, and push the tag:
   ```
   git tag 0.4.1
   git push origin 0.4.1
   ```
3. The workflow builds and pushes `umichbfxcore/orochi_r:0.4.1`. The run's summary records the image digest and the commit it was built from, and the run's artifacts include the installed package versions.

Don't re-push or overwrite an existing image tag. Release a new version instead.
