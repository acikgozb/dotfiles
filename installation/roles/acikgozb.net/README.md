# `acikgozb.net`

This role installs commonly used network troubleshooting tools.
It also configures `NetworkManager` to:

- Use `iwd` as it's main WiFi backend, compared to `wpa_supplicant`.
- Use `systemd-resolved` as its main DNS resolver.
- Use Cloudflare's DNS server `1.1.1.1` as its primary DNS server. Rest of the `systemd-resolved` configurations are kept as default.

## Requirements

Currently, this role only supports Arch Linux hosts that run `systemd` as their service manager and `NetworkManager` as their network manager.

## Role Variables

Here is a list of the variables that are used:

`nw_packages`: This variable is used to specify the packages that this role should install to the host.
The installation method depends on the supported operating system. For Arch Linux, `community.general.pacman` is used to install the packages.

(Playbook specific) `dotfiles_user`: This variable is used set the ownership of the generated user specific configuration files accordingly.

(Playbook specific) `dotfiles_user_group`: This variable is used set the group ownership of the generated user specific configuration files accordingly.

## Dependencies

Once the requirements are met, then there are no other dependencies.

If this role is used as a standalone role, then `dotfiles_user` and `dotfiles_user_group` variables are needed to correctly configure the ownership of the generated configuration files.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yml
- hosts: localhost
  roles:
    - acikgozb.net
```

## License

BSD
