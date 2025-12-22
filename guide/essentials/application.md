# Application

The `ElementaryUI.Application` type defines an entry-point into your app. It holds your [root view](views.md) (the start of the view hierarchy) and drives rendering.

## Mounting an application

Mounting an application means **attaching its rendered output to the DOM**. After mounting, ElementaryUI keeps the DOM in sync as your views change.

```swift
@main
struct MyApp {
  static func main() {
    Application(ContentView())
      .mount(in: .body)
  }
}
```

The `ElementaryUI.Application.mount(in:)` supports arbitrary CSS selectors. You can mount an application into any parent element.

```swift
Application(ContentView())
  .mount(in: "#app")
```

## Multiple applications

You can create and mount multiple applications on the same page. This is useful for adding "islands" of interactivity to an otherwise static page.

```swift
@main
struct IslandsApp {
  static func main() {
    Application(Navigation())
      .mount(in: "#nav-container")

    Application(CommentsSection())
      .mount(in: "#comments-island")
  }
}
```

Each call to `ElementaryUI.Application.mount(in:)` creates an independent application instance with its own state and lifecycle.
