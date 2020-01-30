---
date: 2020-01-16 15:14
description: How to get started building a static website using Swift's Publish library by John Sundell.
tags: iOS Dev, Frameworks
---
# Get started with John Sundell's Publish

## Install Publish
Run in Terminal

```zsh
$ git clone https://github.com/JohnSundell/Publish.git
$ cd Publish
$ make
$ mkdir Leonte.dev
$ cd Leonte.dev
$ publish new
$ open Package.swift
```

Run (CMD+R) the project. It will create an Output folder

## Run a local HTTP server

```zsh
$ cd Output
$ python -m SimpleHTTPServer 8080
```

Now open http://localhost:8080/ in a browser to see your 'Hello World!' website.

## Start customizing your website

In Xcode, open Sources > Leontedev > main.swift

Modify the struct's properties to customize your website.

```swift
struct Leontedev: Website {
```

You'll also want to create your own theme. I made a copy of the theme that comes built-in and worked on that one.

You can get inspiration from my own implementation: https://github.com/leontedev/Publish-leonte.dev
