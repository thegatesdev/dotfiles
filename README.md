# Dotfiles

This repository contains my system configuration as a Nix Flake.

_All modules are intended for my own personal use. I make no promises regarding usfullness, usability or stability. Use/copy paste at your own risk._

**This is still in development!**

## Structure

| Path                                   | Description                                        |
| -------------------------------------- | -------------------------------------------------- |
| [`./parts/{type}`](./parts/)           | Re-usable Nix modules                              |
| [`./profiles/{type}`](./profiles/)     | System and user specific Nix modules               |
| [`./helpers`](./helpers/default.nix)   | Helper functions for creating system user profiles |
| [`./profiles`](./profiles/default.nix) | Attribute set defining system and user profiles    |

## Profiles

| Name                                            | Description                                 |
| ----------------------------------------------- | ------------------------------------------- |
| [nixos/pure](./profiles/nixos/pure/default.nix) | Primary system, an Acer Nitro V15 laptop    |
| [nixos/yume](./profiles/nixos/yume/default.nix) | Staging/testing VirtualBox VM               |
| [home/chill](./profiles/home/chill/default.nix) | Asthetic home for personal work and leisure |
| [home/work](./profiles/home/work/default.nix)   | Professional work environment               |

## Parts

Most included parts are the result of following NixOS Wiki for some particular topic. All parts are included by default. More advanced parts declare options that can be defined in the profile to modify behaviour.

## ToDo Overview

- [x] Create and verify modules for running a basic system
- [x] Add users to systems with Home Manager support
- [ ] Create SwayWM configuration
- [ ] Create i3 configuration _(if needed)_
- [ ] List, install and configure necessary programs
- [x] Set up theme module structure
- [ ] Create themes

## Trivia

### Laptop specs

| Part | Info                               |
| ---- | ---------------------------------- |
| CPU  | AMD Ryzen 7 7735HS (3.20 GHz)      |
| GPU  | NVIDIA GeForce RTX 4060 Laptop GPU |
| RAM  | _2x_ 16GB DDR5                     |

### Why Nix?

NixOS is the closest thing to what _I think_ is a perfect Operating System. Not knowing what changes were made to a system was a major gripe from me on both Windows and Linux. I started writing documentation for every modification. With NixOS, the system is my documentation.
Additionally, because NixOS is a higher level description of the system, it can incorporate fixes and best practices to parts of the system without the user having to worry about them.
