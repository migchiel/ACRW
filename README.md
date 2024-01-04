# ACRW

ArmorCode REST Api wrapper written in Pharo (Smalltalk)

# _Build status_ : [![workflow](https://github.com/migchiel/ACRW/actions/workflows/ci.yml/badge.svg)](https://github.com/migchiel/ACRW/actions)
#

## Installation

The ArmorCode SAAS platform has a very complete REST API, the details of which can be found here: https://app.armorcode.com/api-docs/swagger-ui/index.html#/

ACRW is implemented in Pharo (https://pharo.org/)

You will need to install Pharo first using this zero conf script for linux 
and OSX :  'curl -L https://get.pharo.org/64/ | bash'. or 'wget -O- https://get.pharo.org/64 | bash' depending on curl or wget being installed.

The Pharo installer for all the supported OS's can be found here: https://pharo.org/download

## Installation

You can load the ACRW code into Pharo using Metacello

```Smalltalk
Metacello new
  repository: 'github://migchiel/ACRW/src';
  baseline: 'ACRW';
  load.
```
