# List Rendering

## `ForEach`

Use `ElementaryUI.Elementary.ForEach` when you need a stable key for your list items (reordering, insertions, animations). You can either use elements that implement `Identifiable`, or the `ElementaryUI.Elementary.ForEach.init(_:key:content:)` initializer that takes a `key` closure.

<<< @/swift/Sources/Snippets/ListStrings.swift#snippet

<elementary-snippet file="ListStrings" />

::: info NOTE

To maintain *Embedded Swift* support, only types that are `LosslessStringConvertible` can be used as keys. Keys are considered equal if their UTF8 represenatations are equal.

::: 

## `for ... in`

For simple cases where a stable identity does not matter, you can also just iterate a collection.


```swift
div {
    for item in items {
        p { item.title }
    }
}
```

