# acikgozb.hashicorp

This role is responsible from installing the tools that belong to Hashicorp.
For Linux, only Terraform is installed.
For Darwin, Vagrant is installed along with Terraform.

## Requirements

This role assumes that any Linux host that is running it will have `AMD64` architecture, and any Darwin host will have `ARM64` architecture.

Therefore, `ARM64` Linux hosts are currently not supported by this role due to simplicity.

## Role Variables

Based on how Hashicorp organizes their binaries, there are two types of binaries: the ones that are installed via an image (`.dmg` files on Darwin), and the ones that are archived (`.zip` files).

Here's a list of variables that are used by this role:

| Variable                               | Example (if possible, default value)      | Details                                                                                                                                                                                                                                                                                                                |
| -------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `terraform_version`                    | `1.9.2`                                   | The version of Terraform that will be installed on host.                                                                                                                                                                                                                                                               |
| `vagrant_version`                      | `2.4.1`                                   | The version of Vagrant that will be installed on host.                                                                                                                                                                                                                                                                 |
| `hashicorp_tools.Linux`                | A list with `{name: string, url: string}` | A list which contains metadata about the tool, used for installations on Linux hosts.                                                                                                                                                                                                                                  |
| `hashicorp_tools.Darwin`               | A list with `{name: string, url: string}` | A list which contains metadata about the tool, used for installations on Darwin hosts.                                                                                                                                                                                                                                 |
| `hashicorp_tools.[Linux, Darwin].name` | Tool name (`vagrant`, `terraform`)        | The name of the tool, mostly used for the temporary files during installation.                                                                                                                                                                                                                                         |
| `hashicorp_tools.[Linux, Darwin].url`  | The binary url for given tool             | The url of the tool's prebuilt binary, which will be downloaded to install. Changing version variables will effect the corresponding url as well.                                                                                                                                                                      |
| `hashicorp_tools.[Linux, Darwin].type` | "archive"                                 | The type of the installation for a specific tool. Most tools are installed via unarchiving the downloaded files, however in some cases (especially on Darwin), the installation is done through an image, which needs to be mounted. If the tool requires an image to install, use "package", otherwise use "archive". |
| `hashicorp_tools.[Darwin].pkg`         | `/path/to/.pkg/inside/image`              | Points to the path of the `.pkg` file inside an image. This variable only takes effect when `type` is set to `package`.                                                                                                                                                                                                |
| `hashicorp_tools.[Darwin].lib`         | `/path/to/default/install`                | The path that gets added when .pkg is installed. Most of the time this might be `/usr/local/bin`, but it may vary between tools. This variable only takes effect when `type` is set to `package`.                                                                                                                      |
| `hashicorp_tools.[Darwin].bin`         | `/path/to/binary`                         | The path that points to the actual binary after installation. This path is used to move the binary from global scope to under `$HOME`. This variable only takes effect when `type` is set to `package`.                                                                                                                |
| `hashicorp_tools.[Darwin].link`        | `/path/to/symlink`                        | The path that points to the default symlink created by the installation. Most of the time this might be `/usr/local/bin`, but it may vary between tools. This path is used to remove the global symlik to prevent confusion during `$PATH` lookup. This variable only takes effect when `type` is set to `package`.    |

## Dependencies

None.

## Example Playbook

Here is a basic usage of this role:

```yml
- hosts: servers
  roles:
    - acikgozb.hashicorp
```

If you need to change how it works, see the Role Variables section above.

## License

BSD

## Author Information

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
