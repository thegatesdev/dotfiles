# Dotfiles

This repository contains my system configuration as a Nix Flake.

## Overview

All configuration uses standard Nix features, without additional structuring libraries.

This is intended as a personal flake. I make no promises regarding usfullness, usability or stability. Use/copy paste at your own risk.

## Structure

The `./modules` directory contains all re-usable Nix modules for NixOS and Home Manager.

The `./profiles` directory contains all system / user specific Nix modules.

The `./helpers.nix` module contains two helper functions for creating a NixOS system and a Home Manager configuration from a profile name. A profile is loaded by including *all* modules for it's type (`nixos` or `home`), and the profile itself.

## NixOS Profiles

### Pure

My primary system, an Acer Nitro V15 laptop.
Most existing modules are enabled on this machine.

|Part|Info|
|-|-|
|CPU|AMD Ryzen 7 7735HS (3.20 GHz)|
|GPU|NVIDIA GeForce RTX 4060 Laptop GPU|
|RAM|*2x* 16GB DDR5|

### Yume

My staging / testing VM system.
Exists to test modules from Windows, removes some hardware specific modules and includes VirtualBox Guest Additions.

Will eventually transition to a minimal install medium / USB system.

## Home Profiles

### Chill

For when I'm working on my own things, hanging out or gaming.

### Work

For when I'm at work, or need to focus on work tasks.

## Trivia

### Why Nix?

NixOS is the closest thing to what *I think* is a perfect Operating System. Not knowing what changes were made to a system was a major gripe from me on both Windows and Linux. I started writing documentation for every modification. With NixOS, the system is my documentation.

### Why no library (Flake parts and such)?

This setup works for me, and it's easy to understand. I don't need to build for the full range of system types.