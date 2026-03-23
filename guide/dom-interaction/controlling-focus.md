# Controlling Focus

Use `ElementaryUI.FocusState` to read and control which input is focused.

Focus bindings are attached to focusable views with:

- `ElementaryUI.View.focused(_:)` for a single `Bool` focus target
- `ElementaryUI.View.focused(_:equals:)` for multiple fields tracked by a `Hashable` value like an enum.

## Example

This form uses a keyed `@FocusState` to read and move focus.

<<< @/swift/Sources/Snippets/FocusStateForm.swift#snippet

<elementary-snippet file="FocusStateForm" />
