# Ansible Role: powerline

An Ansible role that installs powerline on Linux.

## Requirements

None

## Role Variables

Available variables are listed below, along with default values:

    powerline_default_top_theme: powerline
    powerline_shell_vcs_branch: true
    powerline_home_dirs:
      - /etc/skel
      - /root

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
        - { role: mjanser.powerline }

## License

MIT
