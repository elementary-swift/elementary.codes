# Conditional Rendering

You can use Swift's familiar _result builder_ control flow inside your `body`.

## `if`

<<< @/swift/Sources/Snippets/IfView.swift#snippet

<elementary-snippet file="IfView" />

## `if / else`

```swift
if isLoggedIn {
    LogOutButton()
} else {
    LogInButton()
}
```

## `switch`

```swift
switch state {
case .loading:
    "Loading…"
case .error:
    "Something went wrong."
case .ready:
    Content()
}
```
