# Ansible Role: powerline

An Ansible role that installs powerline on Linux.

## Requirements

None

## Role Variables

Available variables are listed below, along with default values:

    powerline_default_top_theme: powerline
    powerline_shell_vcs_branch: yes
    powerline_vim: no
    powerline_tmux: no

### Top theme

With the variable `powerline_default_top_theme` you can define the default top theme of powerline.

### VCS branch

By default the VCS branch will be displayed in powerline if available.
This can be disabled with setting `powerline_shell_vcs_branch` to `no`.

### Vim

If the variable `powerline_vim` is set to `yes` the vim-integration of powerline will be installed.

### Tmux

If the variable `powerline_tmux` is set to `yes` the tmux-integration of powerline will be installed.

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
        - { role: mjanser.powerline }

## License

MIT
