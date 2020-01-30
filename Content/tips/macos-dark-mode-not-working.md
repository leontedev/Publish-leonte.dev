---
date: 2020-01-16 15:14
description: MacOS Catalina Dark Mode broken
tags: iOS Dev
---
# MacOS Dark Mode broken
I was having this issue where I was switching back and forth between Light & Dark mode, and only the top status bar would switch. All the other apps would stay on Light mode.
The command below executed in Terminal and a quick log out solved it.
```zsh
defaults delete -g NSRequiresAquaSystemAppearance
```
