# Handling events

ElementaryUI provides on*Event* modifiers to handle DOM events like clicks, key presses, or mouse events.

::: warning 🚧 🚧 🚧
This section is incomplete.
:::

## Available events

- `ElementaryUI.View.onClick(_:)`
- `ElementaryUI.View.onMouseDown(_:)`
- `ElementaryUI.View.onMouseMove(_:)`
- `ElementaryUI.View.onMouseUp(_:)`
- `ElementaryUI.View.onKeyDown(_:)`
- `ElementaryUI.View.onInput(_:)`

## Example

Use `ElementaryUI.View.onMouseMove(_:)` to track mouse movement:

<<< @/swift/Sources/Snippets/MouseTracker.swift#snippet

<elementary-snippet file="MouseTracker" />
