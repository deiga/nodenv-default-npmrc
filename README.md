# nodenv-default-npmrc

This nodenv plugin hooks into the `nodenv install` command to automatically
install a `npmrc` file every time you install a new version of Node. It
requires the `node-build` plugin to be installed.

Forked from the excellent [`nodenv-default-packages`][nodenv-default-packages] plugin from
[sstephenson][sstephenson].

## Installation

### Installing as a nodenv plugin

Make sure you have the latest nodenv and node-build versions, then run:

    git clone https://github.com/deiga/nodenv-default-npmrc.git $(nodenv root)/plugins/nodenv-default-npmrc

### Installing with Homebrew (for OS X users)

Mac OS X users can install nodenv-default-npmrc with the
[Homebrew](http://brew.sh) package manager.

*This is the recommended method of installation if you installed nodenv
 with Homebrew.*

```
$ brew install nodenv/deiga/nodenv-default-npmrc
```

Or, if you would like to install the latest development release:

```
$ brew install --HEAD nodenv/deiga/nodenv-default-npmrc
```

## Usage

nodenv-default-npmrc automatically installs the 
`$(nodenv root)/default-npmrc` file to `${PREFIX}/etc/npmrc` every time you successfully install a new
version of Node with `nodenv install`.


## Credits

Forked from [Sam Stephenson][sstephenson]'s [nodenv-default-packages][] by [Timo Sand][deiga].

[sstephenson]: https://github.com/sstephenson
[nodenv-default-packages]: https://github.com/rbenv/nodenv-default-packages
[deiga]: https://github.com/deiga
[nodenv]: https://github.com/nodenv/nodenv
