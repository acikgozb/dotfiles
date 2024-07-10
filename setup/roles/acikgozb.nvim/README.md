# acikgozb.nvim

This role is mainly responsible from installing Neovim to the host. Along with it, it also installs the languages used within Neovim and the tools which are actively used outside of Neovim during development.

## Requirements

Since this role is designed to work for my purposes, there are 2 main requirements for it to work:

1 - For Linux, this role can only work for hosts which have amd64 architecture. Unfortunately, Neovim does not have an arm64 Linux binary, so it is not supported.
2 - Any host that uses this role must have ZSH configured under $HOME/.config/zsh.

## Role Variables

<!--TODO: Add variables here -->

## Dependencies

Ideally, if you are using this role, it is recommended to use `acikgozb.zsh` role as well.
If not, you should install and configure ZSH manually under $HOME/.config.

## Example Playbook

    - hosts: servers
      roles:
         - acikgozb.zsh
         - acikgozb.nvim

## License

BSD
