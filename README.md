# orochi_r
R image for Orochi pipelines

Published as [`umichbfxcore/orochi_r`](https://hub.docker.com/r/umichbfxcore/orochi_r) on Docker Hub.

## Releasing a new image

Images are built and pushed by GitHub Actions (`.github/workflows/build.yaml`). Pull requests build the image without pushing it, which checks `Dockerfile` changes before release.

1. Merge the `Dockerfile` changes and a `CHANGELOG` entry for the new version into `master`.
2. Tag the merge commit with the version, without a `v` prefix, and push the tag:
   ```
   git tag 0.4.1
   git push origin 0.4.1
   ```
3. The workflow builds and pushes `umichbfxcore/orochi_r:0.4.1`. The run's summary records the image digest and the commit it was built from.

Don't re-push or overwrite an existing image tag. Release a new version instead.
