

Designed to be triggered by pull requests opened in a mkdocs repo, will build and serve head branch here.

An `index.html` page should point to all current deployments.

## Deploy

Calling [`deploy.yml`](.github/workflows/deploy.yml) with `targets` containing the name(s) of open pull request branch(es), `{REPO_NAME}:{BRANCH_NAME}`, space delimited (e.g. `repo1:branch1 repo2:branch1`)  will build and serve the site(s) to `callumwalley.github.io/mkdocs-demo-deploy/{REPO_NAME}/{BRANCH_NAME}`.

Previous cache is re-used (unless `use-cache: false`), meaning multiple branches can be deployed concurrently without having to rebuild.

## Clear Cache

The [`clear_cache.yml`](.github/workflows/clear_cache.yml) action should run once a week, rebuilding only the currently open branches to ensure closed PR branches don't stay deployed forever.

## Why is this under my personal account?

Because workflow requires adding a Personal Access Token (PAT) to triggering workflows and I don't have permissions to create PATs for nesi-org.
