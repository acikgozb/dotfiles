# Dotfiles Installation

In order to use the configurations in this repository, there are couple steps that needs to be done.

## Disclaimer

The configuration for my dotfiles is written in a way that most of the tools are installed locally under `$HOME`. While the setup of this approach is more complex compared to dumping everything to `/usr/local/bin`, it makes the host configuration a lot more maintainable and easier to understand.

However, there are some tools which had to be installed globally, such as `zsh` and `tmux`.

Before continuing with the setup, let me say that the intended usage of this repository is on a host without any pre-existing configurations.
And since a local development environment varies from person to person, I would encourage you to automate your own local environment and consider this repository as a reference, instead of installing my dotfiles directly.

If you still want to try it out, do not forget to create a backup of your old configuration in case of conflicts.

## Limitations

Unfortunately, there are some limitations regarding the supported operating systems and architectures.

- Any Linux host with `arm64` architecture is not supported for now. This is due to the fact that Neovim does not have an `arm64` Linux binary.
- In line with the previous point, any Linux host is considered to have `amd64` architecture, and any Darwin host is considered to have `arm64` architecture. If your host does not fall into either, then the installation won't work.

As a last point, currently the operating systems below are supported:

- amd64 Ubuntu 24.04
- arm64 MacOS

The closest support will be for Fedora, but the rest have to wait due to the current needs.

If you pass all these limitations, feel free to continue reading.

## Required Tools

The setup of this dotfiles are written in `Ansible`, and tested on a `Ubuntu 24.04 Vagrant VM`. Therefore, you absolutely need to [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) before starting.

If you want to dive deep in to the main playbook and test it, you need to [install Vagrant](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-install?product_intent=vagrant) as well.

## Clone the Repository

With the tools installed and ready to go, it's time to clone the repository.

This repository is designed to be under `$HOME/.config`, so ensure that the directory exists and clone the repository there:

```bash
mkdir ~/.config
git clone git@github.com:acikgozb/dotfiles.git ~/.config
```

The clone part is pretty standard, if the directory is empty it should work without any issues.

## `setup` Directory

The main installation and configuration of your host happens under `~/.config/setup` directory. This is the main place where our Ansible playbook lives, along with anything it needs.

If you have had an experience working with Ansible, this directory will feel familiar to you. You can check the roles and variables in detail to see how everything works.

To start the setup process, simply cd into setup directory and run `make setup`:

```bash
cd ~/.config/setup
make setup
```

Some tasks need to be run via elevated privileges, therefore Ansible will ask the password of the `$USER`. Enter your password and then the installation starts.

## Post Installation

Once the installation has completed (no errors from Ansible playbook), simply restart your Terminal session and you are good to go.

I use Kitty as my main Terminal, so you can open that up as well if you wish!