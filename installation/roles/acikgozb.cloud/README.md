# `acikgozb.cloud`

This role installs and configures necessary programs that are used for cloud development.
It groups the functionality like below:

- Cloud providers: AWS is installed via installing `aws-cli`.

- Containerization: `podman` is installed to interact with Linux containers.

- IaC: `terraform` is installed for IaC (infrastructure as code) development.

## Requirements

Currently, this role only supports Arch Linux hosts.

Before executing the role, read the next section to understand which variables are used and if the default values need adjustments for your needs.

## Role Variables

Here is a list of variables that are defined for this role.
All of them can be overridden by user defined playbook variables:

`aws_install_dir`

This variable is used to define that path that holds the installation files.
By default, the path is set as `{{ lib_path }}/aws-cli` to be in sync with the default path for other programs installed via `dotfiles`.
It is used internally by `awscli` to put the installation files under the correct path defined by the user, as seen in `awscli` docs:

`sudo ./aws/install --install-dir aws_lib_dir`

`aws_bin_dir`

This variable is used to define the bin path for AWS CLI binary.
By default, the path is set as `{{ xdg_bin_home }}` to be in sync with the default path for other programs installed via `dotfiles`.
It is used internally by `awscli` to put the bin under the correct path defined by the user, as seen in its docs:

`sudo ./aws/install --bin-dir aws_bin_dir`

`aws_archive_url.amd64`

This variables stores the link that holds the installation for AWS CLI, provided by AWS.

`update_aws`

This variable is used to update the existing AWS CLI binary on a given host.
By default, it is assumed that AWS CLI does not exist on a given host, therefore `update_aws` is set to `false`.
Users need to set this variable to `true` in order to update their existing AWS CLI binaries.

`terraform_version`

This variable is used to download the specified version of Terraform from Hashicorp.

`terraform_archive.name`

This variable is used to locate the binary that will be copied from unarchived Terraform files.

`terraform_archive.url`

This variable stores the link that holds the prebuilt Terraform binary for a given `terraform_version`, provided by Hashicorp.

Here is a list of variables below that need to be defined externally:

`dotfiles_user`

This variable is used set the ownership of the created files and directories.

`dotfiles_user_group`

This variable is used set the group ownership of the created files and directories.

`dotfiles_arch`

This variable is used to download the programs that are built for the architecture of a given host.
Currently, this role only installs programs that are built for `amd64` hosts.

`prebuilt_pkg_path`

This variable is used during the installation of Terraform.
This role puts Terraform under `prebuilt_pkg_path/terraform` in order to be in sync with other prebuilt programs' installation path.

If this role is used as a standalone role, this variable needs to be defined accordingly by the user in order to store the Terraform binary.

`xdg_bin_home`

This variable is used as the default path that is used during AWS CLI installation.
Please check `aws_bin_dir` above for the usage.

Since this role is designed to install AWS CLI on userspace under `$HOME`, it uses this variable to find the correct path.

The default value of this variable is defined based on XDG Base Directory specification, which is `$HOME/.local/bin`.

`lib_path`

This variable is used to define where to store the installation files of AWS CLI.
By default, it is set as `$HOME/.local/lib` and the same value is used to be in sync with source files' of other packages that are put by `dotfiles`.

## Dependencies

Since this role is designed for Arch Linux, the necessary dependencies are checked via `community.general.pacman` module.
Podman is installed via `community.general.podman` as well.
Therefore, if this role is used as a standalone role, `community.general` collection needs to be installed.

## Example Playbook

```yml
- hosts: localhost
  become: true
  gather_facts: true
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_arch
    - xdg_bin_home
    - lib_path
    - prebuilt_pkg_path
  roles:
    - acikgozb.cloud
```

## License

BSD
