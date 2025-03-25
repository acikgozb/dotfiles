# The Architecture of `dotfiles`

This document represents the most up to date architecture of `dotfiles`, to explain the thought process to users that aim to use this project on their own hosts.

## The Main Requirement

The main requirement of this project is to install and configure the programs that must exist on a host to avoid doing repeated work.
The "must exist" part depends on the personal taste.

Therefore, the architectural decisions start from defining the required steps: _installation_ and _configuration_ of the programs.

### Installation of the Programs

There are two main ways to handle the installation of a given program:

- Going with the default installation that the authors prefer,
- Overriding the default installation and customizing it based on the needs.

In `dotfiles`, both ways are used based on the usage of a given program:

- If it is something that is used by many other programs, or if it has an installation that is too risky to change, then the default installation is used.

For example, `$SHELL` programs such as `bash` or `zsh` can be installed in a different place, but most of the programs that utilize these expect them to be in a very specific place (definitely outside the userspace). In this case, overriding the default installation path would cause us more harm than good.
Therefore, these kinds of programs are installed via their default installation.

- If the program is mostly a standalone one, then the installation is customized and the programs are put in very specific directories under `$HOME`.

For example, programs like `terraform`, `podman` and `alacritty` are standalone programs.
These are installed under `$HOME` instead of installing globally (e.g. via a package manager).

The reason?
Like it is mentioned at the beginning, it's a matter of personal preference.
I find it easier to maintain and upgrade a program if I know exactly where it is referenced from and which programs use it.
That is all.

With that said, let's talk about the "configuration" part next.

### Configuration of the Programs

When it comes to configuration, there is no right or wrong way.
Again, it's a matter of personal preference.

However, like with many other `dotfiles` projects out there, the installed programs are configured in a way that fits the [XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory) specification.

This means that as long as a given program supports this specification, it's configurations are put under `$XDG_CONFIG_HOME`.
For this project, `$XDG_CONFIG_HOME` is `$HOME/.config`.

The support for XDG Base Directory spec can be seen on [here](https://wiki.archlinux.org/title/XDG_Base_Directory#Support).

Now that both "installation" and "configuration" parts are explained, we can proceed to how these parts are actually implemented.

## Ansible

The main program that powers `dotfiles` is Ansible.
It is basically a configuration management tool, and its main usage is automating the configuration of many hosts via YML and Jinja (for templates).

Whilst Ansible makes things a little bit complex, I accepted the tradeoff simply because:

- Ansible makes the intention really clear.
  Reading an Ansible role tells exactly what program is installed and how it is configured, which is really important to explain what this project does to others.
  It also helps with the maintainability as well.

- Ansible makes the installation really extensible.
  Even though currently `dotfiles` is designed for Arch Linux, Ansible makes it really easy to extend this project.
  The "facts" it gathers from hosts allow us to easily add support for other operating systems and the directory structure makes it really easy to understand when we extend the roles.

- Ansible helps with idempotency.
  Most of the Ansible modules are idempotent, meaning that the modules do not do anything if there are no changes that need to be done.
  This project could be implemented with nothing but Bash, but achieving idempotency in Bash is not as simple as doing it in Ansible.

- Ansible has well known standards.
  It is really easy to find your way around in an Ansible project simply because most of the Ansible projects follow more or less a similar path.
  If we compare this with Bash scripting, where the convention is basically what the user sets, it becomes clear that Ansible makes the project relatively _easier_ to follow, even though nested directory structures and different files come into play.

With that said, the top level directory structure of the project becomes clear if we combine all the sections above:

- `.config`: This directory contains the end result of the installation, the files in this directory are the ones that are symlinked under `$XDG_CONFIG_HOME` at the end of the day.

- `installation`: Pretty much self explanatory. This directory contains the Ansible code which users run to install `dotfiles`.

Now that the directories are explained, it's time to explain the `installation` directory, which contains an Ansible playbook.

### Ansible Playbook

The playbook is the entrypoint of the installation.
It is what the users execute once they run `make install`.

Being an entrypoint, the playbook is designed to glue certain parts of the installation:

- `hosts`: This field determines the hosts that the installation should run against. Since this project exclusively deals with `localhost`, there is only a single host. This is defined in `inventory.ini`.

- `become`: This field determines whether the installation should use elevated privileges or not.
  Since some parts of the installation needs elevated privileges due to touching certain directories outside `$HOME`, this field is enabled.

- `gather_facts`: This field is used to collect useful information regarding the host that the playbook is run against.
  This is the main field that allows Ansible to be really extensible.
  Even though the installation is designed for Arch Linux hosts, this field is enabled to organize the roles based on the operating system information it gets from Ansible.

- `pre_tasks`: This field is used to run tasks before the main work gets executed. It is used in this project to prepare the host environment before using them to install packages.

- `roles`: This field is used to specify which Ansible roles are used in the playbook. An Ansible role is an abstraction that contains tasks that are related in terms of a given functionality (e.g. installing and configuring `$SHELL`).
  This field is basically what brings the whole installation together.

The playbook looks simple at first sight, because the actual work is done via the roles.
They are the final piece of the puzzle that we need to discuss next.

### Ansible Roles

Like mentioned above, the roles in the playbook are defined to group certain parts of the installation by their functionality, such as:

- Installing and configuring `$SHELL`,
- Installing and configuring `$EDITOR`,
- Configuring networking,
- Configuring Gitflow,
- ...

The roles are designed to support different operating systems by default.
Here is why:

- As explained before, Ansible makes this really easy by gathering "facts" about the host.
  Combined with the dynamic importing, the support can be easily added by simply adding a new file under the role called `{{ ansible_os_family }}.yml`.

- The new version of `dotfiles` aims to fully support Arch Linux, but the old version actually supported Darwin, Ubuntu, and Fedora.
  This decision was made due to time constraints, but the current support for other operating systems were not removed completely.
  That is why, the roles are kept with multiple OS support in mind.

The tasks inside the roles are implementation details, so they are not discussed in here.
So here is how the installation looks like:

```txt

Playbook -> Role1 (Task1, Task2, ...) -> Role2 (Task1, Task2, ...) -> ... -> RoleN (Task1, Task2)
                      |                            |                                    |
                      v                            v                                    v
            updates $HOME/.config        updates $HOME/.config                updates $HOME/.config

```

Once a role is executed, the necessary configuration files are stored under `dotfiles/.config`.
This directory is then symlinked to `$HOME/.config` to update users' configuration.

And this flow brings us to the final point regarding the installation, which is _how_ the `dotfiles/.config` is populated and why symlinking is done.

## Populating `dotfiles/.config`

As mentioned before, `dotfiles/.config` contains the configuration files that are created for the user during the installation.
These files essentially represent the end result of the installation.

Here are the important points regarding the configuration files:

- Some files are _static_, meaning that they contain nothing specific to the user and only deal with the program that they belong to.
- Some files are _dynamic_, meaning that they contain user specific values. These files are created via _templates_ that are stored in roles.
- Some files are only managed by a single role (e.g. `git/config`).
- Some files are managed by multiple different roles (e.g. `.bashrc`).

In order to cover all of the points above, the roles are written in a way that utilizes Ansible's _templating_ logic.
Here is how a configuration file is made, without going into implementation details:

1 - A template of the configuration file is stored inside the role, regardless of whether it is static or dynamic.
This is done to maintain the same structure in all roles.

2 - During the execution of a role, these templates are rendered and their outputs are stored inside the role.
This step can be skipped but in terms of configuration files that are managed by multiple roles, it is beneficial to see how the individual parts of a file look like in each role.

3 - The last step of a role copies the output under `dotfiles/.config` and then symlinks it with `$XDG_CONFIG_HOME` to finish the installation.

So, here is another diagram to visualize this flow:

```txt

Role -> Files are created from templates inside role
     -> Files are moved to `dotfiles/.config`
     -> `dotfiles/.config` is symlinked to `$XDG_CONFIG_HOME`

```

The files are symlinked because:

- Symlinking makes it clear where the configuration files are actually managed on the host OS.

- Users might need to update the configuration files as time goes on.
  In this case, the changes are synced back to `dotfiles/.config` to keep both sides as up to date as possible.

And that is it.

Up until this point, this document explains the thought process that satisfies the main requirement of `dotfiles`: the installation and configuration of the programs that must exist on a host.

The next and final section explains the "maintenance" part of the project:

## Maintenance

Like with any other software, maintenance is a fundamental need to keep a project alive and functional.
For `dotfiles`, the project has to be maintained whenever a user decides to permanently add a new program, or change an existing configuration based on their needs.

`dotfiles` partially tries to be up to date as much as possible.
However, if there are too many changes or new programs, the installation needs to be updated at the end.

Here are some guidelines to follow:

1 - If an existing configuration is changed under `$XDG_CONFIG_HOME`, the change is reflected back to `dotfiles/.config` via symlinking.
However, the changes are _not_ reflected to the templates that exist under each Ansible role.
Therefore, the user must update their templates accordingly when they decide to change an existing configuration file.
Otherwise, `dotfiles` won't apply those changes to another host if a user decides to switch.
To see the changes, the user can run a diff against the template and the updated configuration file to see what to add to the template.

2 - If a new configuration or program is added under `$XDG_CONFIG_HOME`, the user must update the installation accordingly.
At this point, existing roles might be a good place to reference from.
To find out which configurations are new, symlinks can be followed under `$XDG_CONFIG_HOME`.
The ones that are new and are explicitly added won't have any links to `dotfiles`.

To conclude, this document outlines the decisions made for `dotfiles` for users who want to understand how it works.
It is also designed as a guideance of those who wish to change the project for their own needs.

This document will be updated on each major release.
