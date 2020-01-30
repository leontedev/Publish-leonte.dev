---
date: 2019-12-16 11:10
description: How to get started making a static website using Swift's Publish library by John Sundell.
tags: Tools
---
# MacOS Catalina ZSH customization and aliases
I prefer using Terminal instead of other GUI applications like Finder, GitHub Desktop etc. With MacOS Catalina Apple has switched over to zsh due to some copyright concerns. While bash is still available, I guess it’s a good time to make the switch now.

I’ve decided to start from scratch and dump by previous configuration file.

I’ve found a very good guide over here: www.viget.com/articles/…

## iTerm2
I opted to replace Terminal with iTerm2, mostly because of its plethora of configuration options.

## The .zshrc Configuration File
To configure the shell, enter cd to move to the home directory, and edit the .zshrc file using your favorite editor (nano, vim, sublime, etc).

## Aliases
One great feature is to constantly add aliases for your most used commands. For example I’m doing Paul Hudson’s (of hackingwithswift.com) #100DaysOfSwiftUI challenge. And every day I open iTerm > alias ch=“cd ~/Documents/Dev/HackingWithSwift”

## POWERLEVEL9K Theme
I’ve opted for this theme, and I haven’t customized it very much yet, with the exception of some colors. You can see below how it looks:

```zsh
POWERLEVEL9K_MODE=‘nerdfont-complete’ POWERLEVEL9K_PROMPT_ON_NEWLINE=true POWERLEVEL9K_PROMPT_ADD_NEWLINE=true DEFAULT_USER=‘mihaileonte’ POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=‘231’ POWERLEVEL9K_DIR_HOME_FOREGROUND=‘226’ POWERLEVEL9K_DIR_ETC_FOREGROUND=‘231’ POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=‘231’ POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=‘060’ POWERLEVEL9K_DIR_HOME_BACKGROUND=‘060’ POWERLEVEL9K_DIR_ETC_BACKGROUND=‘060’ POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=‘060’
```
