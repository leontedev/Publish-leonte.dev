---
date: 2019-10-20 13:10
description: How to save an image in Sketch with currentColor
tags: Design, Sketch
---
# Export a svg to use currentColor

Sketch uses some weird configuration when exporting an image in SVG. To get around it I found an useful plugin.

## Add SVGO plugin

https://github.com/sketch-hq/svgo-compressor

## Configure plugin

In Sketch open:

Plugins -> SVGO Compressor -> About SVGO Compressor -> Edit SVGO Settings...

And replace the .json content with the below:

https://gist.github.com/craigmdennis/ff6e703bfc6fa29c3b1ebb51d0cf0cda
