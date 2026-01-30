# HTML Elements

HTML elements in ElementaryUI are [views](../essentials/views.md) — types that compose into your view hierarchy.

::: info NOTE

The HTML element types come from the [elementary](https://github.com/elementary-swift/elementary) package, which provides the low-level rendering primitives that ElementaryUI builds upon.

Check out the [docs](https://swiftpackageindex.com/elementary-swift/elementary) for more information.

:::

## Using HTML in views

Build up your HTML using the provided lower-case types like `div`, `p`, `button`, and `h1`.

```swift
@View
struct MyView {
  var body: some View {
    div {
      h1 { "Title" }
      p { "Paragraph text" }
      button { "Click me" }
    }
  }
}
```

## Attributes

HTML attributes like `class`, `style`, and `id` are typically set via the element's initializer:

```swift
div(.class("container"), .id("main")) {
  p(.style(["color": "crimson"])) {
    "Styled text"
  }
  input(.type(.text), .placeholder("Enter something"))
}
```

Attributes can also be altered by using the modifier syntax, this allows for easy handling of conditional attributes.

```swift
div {
    p { "Hello" }
        .attributes(.id("maybe-fancy"))
        .attributes(.class("fancy"), when: isFancy)
}
```
