# TODO for Installation w/ Ansible

Ideally, the users should be able to clone the repo, and with a simple command, the installation should start.

The steps:

1 - Find out which tools you want to have, some tools right now only exist on this PC, or MacOS specific, or are useless and should be removed.

2 - Organize the playbook. It's alright to automate the installation for MacOS and Ubuntu machines for now.

- It might be a good idea to write roles for each specific tool you're going to install. For example, there can be roles for Kitty, tmux, and Neovim.

Probably the most complicated one will be Neovim, for that maybe we can do nested roles (?).

3 - While developing the playbook, it's important to test the tools that are installed. So for that, setup a Vagrant VM with Ubuntu Box to test the playbook.

Completed steps:

- A Makefile is added to simplify the installation process. Users only need to have Ansible, after that, they can simply call `make setup` and the installation begins.

- For testing, Vagrant is added with Ubuntu box, and Makefile is updated to contain test steps. There's make for whole test lifecycle (provision a VM, configure with Ansible, destroy VM) and make scripts for each step of the test (init-test, run-test, cleanup-test), in case developers need a bit more faster tests.

- A pre-task stage is written for updating package managers for both MacOS and Ubuntu. For macOS, additional scripts might be needed to install Homebrew first.

- A new role is added for configuring Kitty for both Debian and Darwin. Both OS implementations are completed.

- Vagrantfile is updated with Ubuntu 24.04 box, from 20.04.

- Roles are added for tmux and Git flow as well.

- A role is added for neovim. Currently, Golang is installed, and formatters are still in pending status.

TODO:

- Add roles for:

  - zsh

- For nvim, there may be a need to install formatters and linters globally for the user instead of being them nvim specific. This would help when there is a need to use the tools outside of Neovim.

- Install the tools below globally:

  - yamlfmt
  - jq
  - prettier
  - eslint_d
  - beautysh
  - dlv

- Install the languages below globally:

  - .net
  - js
  - ts

- Add RedHat to the supported list of distrubitions to install the dotfiles.

- After everything is finished, add an uninstall script to remove all changes. This is important to rollback to the pre-config state if there is a faulty installation.

- (not MVP) In the future, make the playbook idempotent, aka if Neovim is already installed, skip it.
