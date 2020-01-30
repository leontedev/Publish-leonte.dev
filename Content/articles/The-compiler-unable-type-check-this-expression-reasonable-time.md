---
date: 2019-10-31 16:10
description: Getting around the SwiftUI error: "The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions"
tags: iOS Dev, SwiftUI
---
# Solving: The compiler is unable to type-check this expression in reasonable time
Just because I’ve added two view modifiers on a Text view

```swift
Text("$\(item.amount)")
    .foregroundColor(item.amount > 100 ? .red : .black)
    .font(item.amount < 10 ? .caption : .headline)
```

I was getting this error:

> The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions

If I commented either of them out, the app would build successfully.

The solution was to extract the subview (the Canvas has to be enabled for the option to appear in the Actions menu) and the error went away.

There seems to be a bug/weird behaviour caused by List/ForEach in conjunction with more… “complex” views.
