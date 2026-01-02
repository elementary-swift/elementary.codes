# Lifecycle Events

ElementaryUI provides lifecycle modifiers to perform side effects as views enter or leave the [view hierarchy](views.md), or when a view's value changes over time.

## `onAppear`

Use the `ElementaryUI.View.onAppear(_:)` modifier to run an action when a view is first added to the hierarchy.

```swift
@View
struct MyView {
  var body: some View {
    div { "Hello" }
      .onAppear {
        print("View appeared!")
      }
  }
}
```

## `onDisappear`

Use the `ElementaryUI.View.onDisappear(_:)` modifier to run an action when a view is removed from hierarchy.

```swift
@View
struct MyView {
  var body: some View {
    div { "Goodbye" }
      .onDisappear {
        print("View disappeared!")
      }
  }
}
```

## `onChange`

The `ElementaryUI.View.onChange(of:initial:_:)` modifier triggers an action whenever a specific value changes.

```swift
@View
struct CounterView {
  @State var count = 0

  var body: some View {
    button { "Increment" }
      .onClick { count += 1 }
      .onChange(of: count) {
        print("Count is now \(count)")
      }
  }
}
```

## `task`

Use the `ElementaryUI.View.task(_:)` modifier to run an asynchronous operation when a view enters the hierarchy. The task is automatically cancelled when the view is removed.

```swift
@View
struct MyView {
  @State var data: String?

  var body: some View {
    div {
      if let data = data {
        data
      } else {
        "Loading..."
      }
    }
    .task {
      data = await fetchData()
    }
  }
}
```

