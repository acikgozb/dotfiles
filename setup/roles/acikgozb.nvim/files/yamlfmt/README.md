# yamlfmt

`yamlfmt` is a formatter for YAML files. It is developed by Google and written in Golang.

For details, you can check it's [official documentation](https://github.com/google/yamlfmt).

## Table of Contents

<!--toc:start-->

- [Installation](#installation)
- [Configuration](#configuration)
<!--toc:end-->

## <a id='installation'></a> Installation

The installation is done automatically by the `Ansible` playbook under the `setup` directory.
To see the exact place where `yamlfmt` is installed, you can check [acikgozb.nvim](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.nvim) Ansible role.

This formatter is installed along with other formatters and languages.

## <a id='configuration'></a> Configuration

`yamlfmt` has quite a bit of options to be play with. For detailed information, you can check it's [official documentation](https://github.com/google/yamlfmt/blob/main/docs/config-file.md).

For me, the only reason why I added a custom `yamlfmt` configuration file is the fact that by default, `yamlfmt` removes blank lines in yaml files.

Since I frequently use blank lines to group different parts of a text, I had to create a custom configuration to override it.
That is why in the configuration I only change the default value of `retain_line_breaks_single` from `false` to `true`.
