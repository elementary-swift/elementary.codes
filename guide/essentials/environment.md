# Environment

The view environment is a mechanism for providing values to a [view hierarchy](views.md) without having to explicitly pass them to every view.

## Defining and providing values

To define a custom environment property, extend `ElementaryUI.EnvironmentValues` and use the `ElementaryUI.@Entry` macro.
This sets up a typed environment key with a default value.

```swift
extension EnvironmentValues {
  @Entry var themeColor: String = "blue"
}
```

You can then provide a value using the `ElementaryUI.View.environment(_:_:)` modifier. The provided value will be accessible down the hierarchy of this view.

```swift
MyView()
  .environment(#Key(\.themeColor), "rebeccapurple")
```

::: info NOTE
Since key paths cannot be used in Embedded Swift, you must wrap them with the `ElementaryUI.#Key(_:)` macro in order to use them at runtime.
:::

## Using environment values in a view

Access environment values in your `ElementaryUI.View` using the `ElementaryUI.Environment` property wrapper.

```swift
@View
struct Greeting {
  @Environment(#Key(\.themeColor)) var color

  var body: some View {
    p(.style(["color": color])) { "Hello" }
  }
}
```

::: info NOTE
`ElementaryUI.Environment` will only work in types annotated with the `ElementaryUI.@View` macro.
:::

## Reactive objects

You can also pass [reactive objects](./state-and-reactivity.md#reactive) directly in the environment. The object's type acts as the environment key.

```swift
@Reactive
final class UserProfile {
  var name: String = "Anonymous"
}

// Providing the object
let profile = UserProfile()
ContentView()
  .environment(profile)

// Reading the object in a sub view
@View
struct ProfileHeader {
  @Environment(UserProfile.self) var profile

  var body: some View {
    p {
      "User: \(profile.name)"
    }
  }
}
```
