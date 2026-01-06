
# Transactions and Animations

ElementaryUI's animation system is built on the concept of **transactions** - discrete units of change that flow through your application.
If you are familiar with SwiftUI's animation system, you should feel right at home.

## What can be animated? {#animatable-values}

ElementaryUI supports three kinds of animatable views.

| Type | Description |
|------|-------------|
| [Built-in modifiers](animatable-modifiers.md) | Modifiers like `ElementaryUI.View.opacity(_:)` or `ElementaryUI.View.offset(x:y:)` are animatable. |
| [Layout and CSS changes](animate-layout-and-css.md) | Modifiers like `ElementaryUI.View.animateContainerLayout(animateContainerSize:)` enable automatic FLIP animations. |
| [Custom animations](custom-animations.md) | Views that implement the `ElementaryUI.Animatable` protocol can define custom animations. |

::: info
While these methods differ in how the animations are performed under the hood, they all participate in the same transaction-based animation system.
:::

## Transactions

Every [state change](../essentials/state-and-reactivity.md) in ElementaryUI happens within a `ElementaryUI.Transaction`. A transaction represents a single logical update that may affect multiple views throughout your hierarchy. 

Animatable views only describe what can be animated, but not when or how: This part is specified by setting an `ElementaryUI.Animation` for a transaction.

You can set an `ElementaryUI.Animation` in the following ways:

+ Modify state within a `ElementaryUI.withAnimation(_:_:)` block
+ Use the `ElementaryUI.View.animation(_:value:)` modifier on a view

Here is an example of how to use `withAnimation`:

<<< @/swift/Sources/Snippets/WithAnimationView.swift#snippet

<elementary-snippet file="WithAnimationView" />

## Animations

The `ElementaryUI.Animation` type is used to describe how the [animatable values](#animatable-values) affected by a [transaction](#transactions) are animated over time.

There are three types of animation:

| Type | Description |
|------|-------------|
| **Springs** | Use the built-in spring animations like `ElementaryUI.Animation.snappy`, `ElementaryUI.Animation.smooth`, and `ElementaryUI.Animation.bouncy`, or define your own `ElementaryUI.Spring`. |
| **Unit Curves** | Use the built-in animations like `ElementaryUI.Animation.linear` and `ElementaryUI.Animation.easeInOut` or define your own `ElementaryUI.UnitCurve`. |
| **Custom** | Define your own animation by implementing the `ElementaryUI.CustomAnimation` protocol. |

### Modifying animations

You can further control how your animations behave by using modifiers like `ElementaryUI.Animation.delay(_:)` or `ElementaryUI.Animation.speed(_:)`. These work on all types of animations.

### Interrupting and stacking animations

ElementaryUI's animation system preserves velocity when animations are interrupted, meaning new animations inherit the current momentum rather than starting from zero - this is especially noticeable with spring animations that feel natural and physics-based. 

Additionally, animations stack seamlessly by default: the system automatically ensures smooth motion even when animations overlap or are triggered at different times.
