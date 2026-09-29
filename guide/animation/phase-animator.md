# PhaseAnimator

Use `ElementaryUI.PhaseAnimator` to animate a view through a sequence of **phases**. Describe the content for each phase, and the animator handles the animations between them.

Both `PhaseAnimator` and the `.phaseAnimator` modifier support continuous and triggered animations.

## Continuous animation

Without a trigger, the animator repeats the sequence while the view is mounted.

This example uses two phases to make a heart pulse:

<<< @/swift/Sources/Snippets/ContinuousPhaseAnimatorView.swift#snippet

<elementary-snippet file="ContinuousPhaseAnimatorView" />

## Triggered animation

Pass a `trigger:` value to run the sequence whenever that value changes. The animator returns to the first phase and stops.

Here, `.phaseAnimator` animates an existing view. Each click adds a heart and makes the hearts lift, jiggle, and return:

<<< @/swift/Sources/Snippets/TriggeredPhaseAnimatorView.swift#snippet

<elementary-snippet file="TriggeredPhaseAnimatorView" />

## Choosing animations

Use the `animation` closure to choose an `ElementaryUI.Animation` for each phase, including the return to the first phase.

Omit the closure to use the default animation, or return `nil` for a step without animation.
