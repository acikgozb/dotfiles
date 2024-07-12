# TODO for Installation w/ Ansible

Ideally, the users should be able to clone the repo, and with a simple command, the installation should start.

TODO:

- Install the tools below:

  - Vagrant (.dmg install on Darwin, prebuilt binary install on Linux)
  - Docker (.dmg install on Darwin, prebuilt binary install on Linux)
  - AWS CLI (install script for both platforms)
  - Terraform (.dmg install on Darwin, prebuilt binary install on Linux)

- Add RedHat to the supported list of distrubitions, along with Debian and Darwin.

- After everything is finished, add an uninstall script to remove all changes. This is important to rollback to the pre-config state if there is a faulty installation.

- (not MVP) In the future, make the playbook more idempotent. There might be some cases where idempotency is not achieved. By default, Ansible does this really well, but unfortunately I had to use ansible.builtin.shell in some places, which those cases the idempotency of the operation depends on the user.
