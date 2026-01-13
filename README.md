# beautysh-action

**A GitHub Action for [beautysh](https://github.com/lovesegfault/beautysh)**

[![Release](https://img.shields.io/github/v/release/illvart/beautysh-action)](https://github.com/illvart/beautysh-action/releases)
[![LICENSE](https://img.shields.io/github/license/illvart/beautysh-action)](https://github.com/illvart/beautysh-action/blob/main/LICENSE)

## Usage

To use this action in your repository, simply create a workflow file (for example `.github/workflows/ci.yml`) with content like this:

```yaml
name: CI

on:
  pull_request:
  push:
    branches:
      - main
      
jobs:
  beautify:
    runs-on: ubuntu-latest
    
    permissions:
      contents: write
    
    steps:
      - name: Checkout
        uses: actions/checkout@v6
        with:
          ref: ${{ github.head_ref }}
          
      - name: Run beautysh
        uses: illvart/beautysh-action@latest
        with:
          # Pass beautysh options in args, for example:
          args: '*.sh --indent-size 4'

      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v7
        with:
          commit_message: 'ci: apply auto-fixes'
          commit_options: '--no-verify'
          commit_user_name: ${{ github.repository_owner }}
          commit_user_email: ${{ github.repository_owner }}@users.noreply.github.com
          
```

If the `args` option is not provided, it defaults to `*.sh`.

To avoid errors when the project directory lacks an `*.sh` file, use `&>/dev/null`.

For a full list of `args`, check the [beautysh docs](https://github.com/lovesegfault/beautysh#usage).

## Supports

If you’re enjoying it or want to support development, feel free to donate. Thank you! ❤️

## Contributing

Want to contribute? Read the [Contributing](docs/CONTRIBUTING.md).

## License

Released under the [MIT License](LICENSE).
