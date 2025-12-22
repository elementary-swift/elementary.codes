# State and Reactivity

[Views](views.md) are essentially **throw-away values** - ElementaryUI rebuilds new copies of view values all the time. They exist to describe UI after state has changed, so the framework can determine the minimal updates to the mounted DOM tree.

If you know SwiftUI, you should feel right at home.

## `@State`

Use the `ElementaryUI.State` property wrapper to declare local, mutable state for a view. Any view that is derived from this state will automatically be re-evaluated whenever it is updated.

<<< @/swift/Sources/Snippets/TinyCounter.swift#snippet

<elementary-snippet file="TinyCounter" />

The lifetime of the state is tied to the **view’s lifetime**. For example, when this `Counter` view first appears in the view hierachy, a new slice of memory is initialized with `0`. As long as the view remains mounted, the current value of `count` is kept. Once the view is removed from the hierarchy, the memory is released again.

## `@Reactive`

Use the `Reactivity.@Reactive` macro to define a reference type that can be used view state.

Any view that accesses one or more properties in its `body` will automatically be re-evaluated when the value of these properties change.

::: info Note

This is essentially `@Observable`, but with support for Embedded Swift.

:::

<<< @/swift/Sources/Snippets/ReactiveCounter.swift#snippet

<elementary-snippet file="ReactiveCounter" />

## `@Binding`

Use `ElementaryUI.Binding` when a child view should read/write state that is owned by a parent view.

You can use the familiar `$` syntax on `ElementaryUI.State` variables to create a binding.

<<< @/swift/Sources/Snippets/BindingCounterButton.swift#snippet

<elementary-snippet file="BindingCounterButton" />

