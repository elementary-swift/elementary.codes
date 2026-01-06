# Animate changes to layout and CSS values

ElementaryUI comes with a ***FLIP*** animation system that enables automatic 
animation of essentially any visible change to your view's layout or appearance.

**FLIP** (First, Last, Invert, Play) is a technique that captures the geometry or appearance of an element before and after a change, then animates the difference. A view can opt-in to FLIP handling with modifiers, and any [transaction with an animation](transactions-and-animations.md#transactions) will be animated accordingly.

### Animate layout containers

You can enable layout FLIP-handling on any [HTML element](../dom-interaction/html-elements.md) by applying the `ElementaryUI.View.animateContainerLayout(animateContainerSize:)` modifier.

Whenever this container's children are added, moved, or removed with an animation, their positions and sizes are automatically animated. By default, the container's size is also animated if it changes as part of the transaction.

<<< @/swift/Sources/Snippets/AnimateLayoutView.swift#snippet

<elementary-snippet file="AnimateLayoutView" />

---
::: warning 🚧 🚧 🚧
FLIP features are not yet fully implemented.

Planned are:
+ animate layout changes when value changes (independent of children)
+ animate arbitrary CSS properties when value changes
+ `matchedGeometryEffect` feature by providing a stable identifier for FLIP
:::