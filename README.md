# figlet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with figlet](#setup)
    * [What figlet affects](#what-figlet-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with figlet](#beginning-with-figlet)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

[figlet](http://www.figlet.org/) is a program that makes large ascii text art
from standard text input. 
## Module Description

This module allows you to use figlet text in other modules as well as create
basic files with figlet text (eg: /etc/motd). An example of this is:

      __ _       _      _   
     / _(_) __ _| | ___| |_ 
    | |_| |/ _` | |/ _ \ __|
    |  _| | (_| | |  __/ |_ 
    |_| |_|\__, |_|\___|\__|
           |___/ 

## Setup

### What figlet affects

The figlet module will need to have figlet application installed on the
puppet master. This can be done by calling "include figlet::install" in
the node definition for your puppet master. It does not need to be
installed on agents to use the function.

### Setup Requirements

* figlet sets up a function and several facts so it will require that
  pluginsync is enabled.
* To install figlet on RedHat based systems, you will also need the
  repoforge repository. If you plan to use the "include figlet::install"
  method of installation on a RedHat system, then you need to have the
  [yguenane/repoforge](https://forge.puppetlabs.com/yguenane/repoforge)
  module installed and setup. There is a direct dependency to
  Yumrepo['repoforge'] and **will fail** if this is not in the catalog.

### Beginning with figlet

To install the figlet module, you can either install from the forge:

    puppet module install zanloy/figlet

or install from github (execute in the modules directory):

    git clone https://github.com/zanloy/puppet-figlet.git figlet

## Usage

To install figlet on the puppet master (include only in puppet master's node
definition)

    include figlet::install

The figlet modules does not have any declarable classes on its own. It is
designed to be used in other modules. A good example of this is to setup a
figlet banner in your motd file:

    file { '/etc/motd':
      content => figlet("$::hostname"),
    }

## Reference

The figlet module create one function and two facts.

    figlet($string, $font, $width)

Facts (should only be relevant on the puppet master):

    figlet_fonts (comma separated string of fonts installed on node)
    figlet_fonts_array (array of fonts installed)

## Limitations

This module has only been tested on the following distros:

* Ubuntu 14.04
* RHEL 6.5

## Development

This module is pretty basic but if you have any improvements, then please add
a new issue with tag [feature] or you are always welcome to add it yourself and
send a pull request.
