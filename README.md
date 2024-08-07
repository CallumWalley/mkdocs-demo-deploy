

Designed to be triggered by pull requests opened in main [support documentation](https://docs.nesi.org.nz) repo.

An `index.html` page should point to all current deployments.

## Deploy

Calling [`deploy.yml`](.github/workflows/deploy.yml) with the name of an open pull request (`pr-branches:{BRANCH_NAME}`) branch will build and serve the site to `callumwalley.github.io/support-docs-dev/{BRANCH_NAME}`.

Previous cache is re-used (unless `use-cache: false`), meaning multiple branches can be deployed concurrently without having to rebuild.

## Clear Cache

The [`clear_cache.yml`](.github/workflows/clear_cache.yml) action should run once a week, rebuilding only the currently open branches to ensure closed PR branches don't stay deployed forever.
