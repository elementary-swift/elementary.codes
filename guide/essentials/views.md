# Views

Views are the fundamental building blocks in ElementaryUI. You describe the user interface by composing views.

## Creating a view

A view is anything that conforms to the `ElementaryUI.View` protocol. You define your own view by applying the `ElementaryUI.@View` to a plain-old `struct`.

The `body` property describes what a `ElementaryUI.View` is composed of.

```swift
@View
struct Greeting {
  var name: String

  var body: some View {
    p { "Hello \(name)" }
  }
}
```

## Compose views

You build up bigger parts of UI by composing smaller views. Placing views inside other views forms the **view hierarchy.**

```swift
@View
struct Screen {
  var body: some View {
    div {
      h1 { "Welcome, mighty pirate" }
      Greeting(name: "Guybrush Threepwood")
    }
  }
}
```

## HTML elements are views

ElementaryUI's [HTML Elements](/guide/dom-interaction/html-elements) (like `div`, `p`, `button`) are views too — they participate in the same composition model as your own views.

That means you can freely mix “element views” and “custom views” in the same hierarchy.
