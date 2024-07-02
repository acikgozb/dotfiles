# TODO for Installation w/ Ansible

Ideally, the users should be able to clone the repo, and with a simple command, the installation should start.

TODO:

- Install the tools below for user (not just nvim):

  - yamlfmt
  - jq
  - prettier
  - eslint_d
  - beautysh
  - dlv

- Install the languages below for user (not just nvim):

  - js (for Darwin)
  - ts (both)

- Add RedHat to the supported list of distrubitions, along with Debian and Darwin.

- After everything is finished, add an uninstall script to remove all changes. This is important to rollback to the pre-config state if there is a faulty installation.

- (not MVP) In the future, make the playbook more idempotent. There might be some cases where idempotency is not achieved. By default, Ansible does this really well, but unfortunately I had to use ansible.builtin.shell in some places, which those cases the idempotency of the operation depends on the user.
