# Dotfiles Installation

In order to use the configurations in this repository, there are couple steps that needs to be done.

## Table of Contents

<!--toc:start-->

- [Disclaimer](#disclaimer)
- [Limitations](#limitations)
- [Required Tools](#required-tools)
- [Clone the Repository](#clone-the-repository)
- [`setup` Directory](#setup-directory)
  - [List of Ansible Roles](#ansible-roles)
- [Post Installation](#post-installation)
<!--toc:end-->

## <a id="disclaimer"></a> Disclaimer

The configuration for my dotfiles is written in a way that most of the tools are installed locally under `$HOME`. While the setup of this approach is more complex compared to dumping everything to `/usr/local/bin`, it makes the host configuration a lot more maintainable and easier to understand.

However, there are some tools which had to be installed globally, such as `zsh` and `tmux`.

Before continuing with the setup, let me say that the intended usage of this repository is on a host without any pre-existing configurations.
And since a local development environment varies from person to person, I would encourage you to automate your own local environment and consider this repository as a reference, instead of installing my dotfiles directly.

If you still want to try it out, do not forget to create a backup of your old configuration in case of conflicts.

## <a id="limitations"></a> Limitations

Unfortunately, there are some limitations regarding the supported operating systems and architectures.

- Any Linux host with `arm64` architecture is not supported for now. This is due to the fact that Neovim does not have an `arm64` Linux binary.
- In line with the previous point, any Linux host is considered to have `amd64` architecture, and any Darwin host is considered to have `arm64` architecture. If your host does not fall into either, then the installation won't work.

As a last point, currently the operating systems below are supported:

- amd64 Arch Linux
- amd64 Fedora
- amd64 Debian (and any flavors)
- arm64 Darwin (MacOS)

Currently, only amd64 Arch Linux is fully supported out of the box due to the changes made to the installation process.
Other operating systems will be fixed in the next stable version, which will be `v0.3.0`.

## <a id="required-tools"></a> Required Tools

The setup of this dotfiles are written in `Ansible`. 
Therefore, you absolutely need to [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) before starting.

If you want to dive deep in to the main playbook and test it, you need to [install Vagrant](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-install?product_intent=vagrant) as well.

## <a id="clone-the-repository"></a> Clone the Repository

With the tools installed and ready to go, it's time to clone the repository.
Since the installation is done through symlinking, you can clone the repository wherever you want.

```bash
git clone git@github.com:acikgozb/dotfiles.git ~/dotfiles
```

The clone part is pretty standard, if the directory is empty it should work without any issues.

## <a id="setup-directory"></a> `setup` Directory

The main installation and configuration of your host happens under `<repo-root-path>/setup` directory. This is the main place where our Ansible playbook lives, along with anything it needs.

If you have had an experience working with Ansible, this directory will feel familiar to you.

To start the setup process, simply cd into setup directory and run `make setup`:

```bash
# Assume that the repository lives under ~/dotfiles.
cd ~/dotfiles/setup
make setup
```

Some tasks need to be run via elevated privileges, therefore Ansible will ask the password of the `$USER`. Enter your password and then the installation starts.

### <a id="ansible-roles"></a> List of Ansible Roles

If you wish to check out each role to understand how the installation work, here is a list of the roles used in Ansible setup playbook:

- [acikgozb.arch](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.arch)
- [acikgozb.aws](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.aws)
- [acikgozb.podman](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.podman)
- [acikgozb.git](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.git)
- [acikgozb.hashicorp](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.hashicorp)
- [acikgozb.kitty](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.kitty)
- [acikgozb.nvim](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.nvim)
- [acikgozb.tmux](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.tmux)
- [acikgozb.shell](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.shell)
- [acikgozb.net](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.net)

## <a id="post-installation"></a> Post Installation

Once the installation has completed (no errors from Ansible playbook), simply restart your Terminal session and you are good to go.

I use Kitty as my main Terminal, so you can open that up as well if you wish!
