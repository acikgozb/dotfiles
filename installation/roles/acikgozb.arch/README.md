# `acikgozb.arch`

This role is responsible for setting the `arch` variable based on whether the OS is Darwin or not.

The main usage for this role is to let other roles know which binary to use, since most (if not all) programs support multiple architectures.

Unfortunately, some programs do not support all the possible "combinations" (e.g `nvim` did not support ARM64 for a long time).
Therefore to keep things simple, all Darwin hosts are assumed **ARM64**, and all Linux hosts are assumed **AMD64**.

While this brings in quite a lot of simplicity, it limits overall cross platform support of the main playbook.
This tradeoff is acknowledged and the rest of the playbook is designed based on this fact.

## Requirements

None.

## Role Variables

None.

## Dependencies

None.

## Example Playbook

It's recommended to put this role at the beginning of your playbook, to make the variable available for all of the tasks.

```yml
- hosts: servers
  roles:
    - acikgozb.arch
```

## License

BSD
