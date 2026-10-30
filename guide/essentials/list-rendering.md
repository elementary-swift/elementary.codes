# List Rendering

## `ForEach`

Use `ElementaryUI.ForEach` when you need a stable id for your list items (reordering, insertions, animations). You can either use elements that implement `Identifiable`, or the `ElementaryUI.ForEach.init(_:id:content:)` initializer that takes an `id` closure returning any `Hashable` value.

<<< @/swift/Sources/Snippets/ListStrings.swift#snippet

<elementary-snippet file="ListStrings" />

## `for ... in`

For simple cases where a stable identity does not matter, you can also just iterate a collection.


```swift
div {
    for item in items {
        p { item.title }
    }
}
```

