---
date: 2020-01-16 15:14
description: Providing a short video demo of the most common workflow in your app will help convert more users to install your app.
tags: iOS Dev
---
# Make an App Review video

Providing a short video demo of the most common workflow in your app will help convert more users to install your app.

## Record video in the Xcode's iOS Simulator

Open Terminal and run the below command to start recording. When finished simply press *Ctrl+C*.

```zsh
xcrun simctl io booted recordVideo --codec=h264 --mask=black --force appVideo.mov
```

The extra arguments are optional:

`--codec` Specifies the codec type: "h264" or "hevc". Default is "hevc".
`--mask` For non-rectangular displays, handle the mask by policy:
ignored: The mask is ignored and the unmasked framebuffer is saved.
alpha: Not supported, but retained for compatibility; the mask is rendered black.
black: The mask is rendered black.
`--force` Force the output file to be written to, even if the file already exists.

## Take a screenshot

For iOS 13 you can need to provide screen captures for two sizes: 6.5" and 5.5" displays. For the 6.5" you can use the *iPhone 11 Pro Max*, and for the 5.5" the *iPhone 8 Plus*. 
Press CMD+S to take a screen shot of the screen.

## Editing the video

You can use the free iMovie to put the video together. Choose File -> New App Preview.
First import (CMD+I) the screen shot, and then the video you recorded. This way the exported video will be the proper resolution.
If you export the video now and you try to add it in App Store Connect, you will receive an error that the video lacks stereo sound. 

## Add Voice over

It can be useful to say a few words to describe the workflow shown in the video. 
Press the Record Voiceover button and start talking after 3s.

## Add background music

You can find royalty-free music on YouTube. Simply find the right tune, download the .mp3 file and import it in iMovie. I usually lower the volume of the music to about 15%, if I'm adding Voiceover as well.

[https://www.youtube.com/audiolibrary/music?nv=1](https://www.youtube.com/audiolibrary/music?nv=1)
