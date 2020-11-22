# Bash shell beautifier

[![Release](https://img.shields.io/github/v/release/illvart/beautysh-action?color=orange)](https://github.com/illvart/beautysh-action/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/illvart/beautysh-action/blob/main/LICENSE)
[![Marketplace](https://img.shields.io/badge/GitHub-Marketplace-blue.svg)](https://github.com/marketplace/actions/bash-shell-beautifier)

A GitHub Action that runs [beautysh](https://github.com/lovesegfault/beautysh) for beautify a bash shell scripts code.

## Usage

To use this action in your repository, create a file like `.github/workflows/ci.yml` with the following example:

```yaml
name: CI

on:
  pull_request:
  push:
    branches:
      - master
      
jobs:
  beautify:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          ref: ${{ github.head_ref }}
          
      - name: Run beautysh
        uses: illvart/beautysh-action@latest
        with:
          # Pass beautysh options in args, for example:
          args: '*.sh --indent-size 4'

      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: '[auto] ci: apply beautysh changes'
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          
```

If there is no `args` option it will fallback into `*.sh`.

To avoid errors when project directory doesn't have an `*.sh` file, you can pass it with `&>/dev/null`.

For a full list of possible `args` checkout the [beautysh docs](https://github.com/lovesegfault/beautysh#usage).
