# Bookmarks

Bookark directories and jump to them.

A port of [OhMyBash][]'s [Bashmarks][] plugin for [packer.nu][].

## Syntax

```
Usage:
  > bm {flags} (name) 

Flags:
  -a, --add - add the PWD as bookmark
  -d, --delete - delete the bookmark
  -l, --list - list bookmarks
  -p, --print - print the bookmark content
  -h, --help - Display this help message

Parameters:
  (optional) name <String>: the bookmark name
```

**Note:** For performance reason the tab-completion list only updates after you run a `bm` command.


## Config

The config variable `file` is used as indication in which file the bookmarks should be stored (default: `$NU_PACKER_HOME/directory_bookmarks.nuon`)


[packer.nu]: https://github.com/jan9103/packer.nu
[OhMyBash]: https://github.com/ohmybash/oh-my-bash
[Bashmarks]: https://github.com/ohmybash/oh-my-bash/tree/master/plugins/bashmarks
